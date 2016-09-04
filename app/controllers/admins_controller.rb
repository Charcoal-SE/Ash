class AdminsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :find]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_admin, :except => [:index, :new, :create, :find]

  def index
    @admins = Admin.joins(:websites).group('admins.id').order('count(admins.id) desc').paginate(:page => params[:page], :per_page => 50)
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
      redirect_to url_for(:controller => :admins, :action => :show, :id => @admin.id)
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
      redirect_to url_for(:controller => :admins, :action => :show, :id => @admin.id)
    else
      flash[:danger] = "Failed to update admin!"
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      flash[:success] = "Successfully removed."
      redirect_to url_for(:controller => :admins, :action => :index)
    else
      flash[:danger] = "Failed to remove admin!"
      render :show
    end
  end

  def find
    @admins = Admin.where('name LIKE ?', "%#{params[:q]}%").or(Admin.where('email LIKE ?', "%#{params[:q]}%"))
    count = @admins.count
    @admins = @admins.paginate(:page => params[:page], :per_page => 20)
    render :json => { :items => @admins, :has_more => (count > (params[:page] || 1) * 20) }
  end

  private
    def set_admin
      @admin = Admin.find params[:id]
    end

    def admin_params
      params.require(:admin).permit(:name, :org, :country, :email, :phone)
    end
end
