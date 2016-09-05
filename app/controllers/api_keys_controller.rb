class ApiKeysController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :set_api_key, :only => [:edit, :update, :destroy]

  def index
    @api_keys = ApiKey.order(:created_at => :desc)
  end

  def new
    @api_key = ApiKey.new
    @api_key.key = Digest::SHA256.hexdigest("#{rand(0..9e9)}#{Time.now}")
  end

  def create
    @api_key = ApiKey.create key_params
    if @api_key.save
      flash[:success] = "Successfully created API key for #{@api_key.app_name} (#{@api_key.user.username})."
      redirect_to url_for(:controller => :api_keys, :action => :index)
    else
      flash[:danger] = "Failed to create API key."
      render :new
    end
  end

  def edit
  end

  def update
    if @api_key.update key_params
      flash[:success] = "Successfully updated API key for #{@api_key.app_name} (#{@api_key.user.username})."
      redirect_to url_for(:controller => :api_keys, :action => :index)
    else
      flash[:danger] = "Failed to update API key."
      render :edit
    end
  end

  def destroy
    if @api_key.destroy
      flash[:success] = "Successfully destroyed API key for #{@api_key.app_name} (#{@api_key.user.username})."
    else
      flash[:danger] = "Failed to destroy API key."
    end
    redirect_to url_for(:controller => :api_keys, :action => :index)
  end

  private
    def key_params
      params.require(:api_key).permit(:key, :app_name, :user_id)
    end

    def set_api_key
      @api_key = ApiKey.find params[:id]
    end
end
