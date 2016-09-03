class TechsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_tech, :except => [:index, :new, :create]

  def index
    @techs = Tech.all
  end

  def show
  end

  def new
    @tech = Tech.new
  end

  def create
    @tech = Tech.create tech_params
    if @tech.save
      flash[:success] = "Successfully created."
      redirect_to url_for(:controller => :tech, :action => :show, :id => @tech.id)
    else
      flash[:danger] = "Failed to create tech!"
      render :new
    end
  end

  def edit
  end

  def update
    if @tech.update tech_params
      flash[:success] =  "Successfully updated."
      redirect_to url_for(:controller => :techs, :action => :show, :id => @tech.id)
    else
      flash[:danger] = "Failed to update tech!"
      render :edit
    end
  end

  def destroy
    if @tech.destroy
      flash[:success] = "Successfully removed."
      redirect_to url_for(:controller => :techs, :action => :index)
    else
      flash[:danger] = "Failed to remove tech!"
      render :show
    end
  end

  private
    def set_tech
      @tech = Tech.find params[:id]
    end

    def tech_params
      params.require(:tech).permit(:name, :org, :country, :email, :phone)
    end
end
