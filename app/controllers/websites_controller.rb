class WebsitesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :json_export]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_website, :except => [:index, :new, :create, :json_export]

  def index
    @websites = Website.all.order(:created_at => :desc).paginate(:page => params[:page], :per_page => 50)
  end

  def show
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.create website_params
    @website.post_count = 1
    if @website.save
      @website.admin.site_count += 1;
      @website.admin.save!

      @website.tech.site_count += 1;
      @website.tech.save!

      @website.registrar.site_count += 1;
      @website.registrar.save!

      flash[:success] = "Successfully created."
      redirect_to url_for(:controller => :websites, :action => :show, :id => @website.id)
    else
      flash[:danger] = "Failed to create website!"
      render :new
    end
  end

  def edit
  end

  def update
    if @website.update website_params
      flash[:success] =  "Successfully updated."
      redirect_to url_for(:controller => :websites, :action => :show, :id => @website.id)
    else
      flash[:danger] = "Failed to update website!"
      render :edit
    end
  end

  def destroy
    if @website.destroy
      flash[:success] = "Successfully removed."
      redirect_to url_for(:controller => :websites, :action => :index)
    else
      flash[:danger] = "Failed to remove website!"
      render :show
    end
  end

  def json_export
    @websites = Website.all.order(:created_at => :desc).paginate(:page => params[:page], :per_page => 50)
  end

  private
    def set_website
      @website = Website.find params[:id]
    end

    def website_params
      params.require(:website).permit(:url, :name_server, :admin_id, :tech_id, :registrar_id)
    end
end
