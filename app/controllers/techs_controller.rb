class TechsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :find]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_tech, :except => [:index, :new, :create, :find]

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
      redirect_to url_for(:controller => :techs, :action => :show, :id => @tech.id)
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

  def find
    @techs = Tech.where('name LIKE ?', "%#{params[:q]}%").or(Tech.where('email LIKE ?', "%#{params[:q]}%"))
    count = @techs.count
    @techs = @techs.paginate(:page => params[:page], :per_page => 20)
    render :json => { :results => @techs, :has_more => (count > (params[:page] || 1) * 20) }
  end

  private
    def set_tech
      @tech = Tech.find params[:id]
    end

    def tech_params
      params.require(:tech).permit(:name, :org, :country, :email, :phone)
    end
end
