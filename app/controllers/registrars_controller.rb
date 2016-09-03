class RegistrarsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_registrar, :except => [:index, :new, :create]

  def index
    @registrars = Registrar.all
  end

  def show
  end

  def new
    @registrar = Registrar.new
  end

  def create
    @registrar = Registrar.create registrar_params
    if @registrar.save
      flash[:success] = "Successfully created."
      redirect_to url_for(:controller => :registrars, :action => :show, :id => @registrar.id)
    else
      flash[:danger] = "Failed to create registrar!"
      render :new
    end
  end

  def edit
  end

  def update
    if @registrar.update registrar_params
      flash[:success] =  "Successfully updated."
      redirect_to url_for(:controller => :registrars, :action => :show, :id => @registrar.id)
    else
      flash[:danger] = "Failed to update registrar!"
      render :edit
    end
  end

  def destroy
    if @registrar.destroy
      flash[:success] = "Successfully removed."
      redirect_to url_for(:controller => :registrars, :action => :index)
    else
      flash[:danger] = "Failed to remove registrar!"
      render :show
    end
  end

  private
    def set_registrar
      @registrar = Registrar.find params[:id]
    end

    def registrar_params
      params.require(:registrar).permit(:name, :url, :email, :phone)
    end
end
