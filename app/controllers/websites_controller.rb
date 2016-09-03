class WebsitesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :verify_admin, :only => [:destroy]
  before_action :set_website, :except => [:index, :new, :create]

  def index
    @websites = Website.all
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
      redirect_to url_for(:controller => :website, :action => :show, :id => @website.id)
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

  private
    def set_website
      @website = Website.find params[:id]
    end

    def website_params
      params.require(:website).permit(:url, :name_server)
    end
end
