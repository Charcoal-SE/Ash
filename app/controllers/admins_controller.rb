class AdminsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_admin, :except => [:index, :new, :create]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create admin_params
    if @admin.save
      flash[:success] = "Successfully created."
      redirect_to path_for(:controller => :admin, :action => :show, :id => @admin.id)
    else
      flash[:danger] = "Failed to create admin!"
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update admin_params
      flash[:success] =  "Successfully updated."
      redirect_to path_for(:controller => :admins, :action => :show, :id => @admin.id)
    else
      flash[:danger] = "Failed to update admin!"
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      flash[:success] = "Successfully removed."
      redirect_to path_for(:controller => :admins, :action => :index)
    else
      flash[:danger] = "Failed to remove admin!"
      render :show
    end
  end

  private
    def set_admin
      @admin = Admin.find params[:id]
    end

    def admin_params
      params.require(:admin).permit(:name, :org, :country, :email, :phone)
    end
end
