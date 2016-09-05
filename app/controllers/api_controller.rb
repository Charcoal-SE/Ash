class ApiController < ApplicationController
  before_action :verify_key
  before_action :set_pagesize, :only => [:websites, :admins, :techs, :registrars]

  # Write methods

  def create_website
    @website = Website.create website_params
    if @website.save
      @website.admin.site_count += 1
      @website.admin.save!

      @website.tech.site_count += 1
      @website.tech.save!

      @website.registrar.site_count += 1
      @website.registrar.save!
    else
      render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the website from being saved.' }
    end
  end

  def create_admin
    @admin = Admin.create admin_params
    unless @admin.save
      render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the admin from being saved.' }
    end
  end

  def create_tech
    @tech = Tech.create tech_params
    unless @tech.save
      render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the tech from being saved.' }
    end
  end

  def create_registrar
    @registrar = Registrar.create registrar_params
    unless @registrar.save
      render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the registrar from being saved.' }
    end
  end

  # Read methods

  def websites
    @websites = Website.order(:created_at => :desc)
    count = @websites.count
    @websites = @websites.paginate(:page => params[:page], :per_page => @pagesize)
    @has_more = has_more?(count, params[:page])
  end

  def admins
    @admins = Admin.order(:created_at => :desc)
    count = @admins.count
    @admins = @admins.paginate(:page => params[:page], :per_page => @pagesize)
    @has_more = has_more?(count, params[:page])
  end

  def techs
    @techs = Tech.order(:created_at => :desc)
    count = @techs.count
    @techs = @techs.paginate(:page => params[:page], :per_page => @pagesize)
    @has_more = has_more?(count, params[:page])
  end

  def registrars
    @registrars = registrar.order(:created_at => :desc)
    count = @registrars.count
    @registrars = @registrars.paginate(:page => params[:page], :per_page => @pagesize)
    @has_more = has_more?(count, params[:page])
  end

  private
    def verify_key
      @key = ApiKey.find_by_key params[:key]
      unless params[:key].present? && @key.present?
        render :status => 403, :json => { :error_code => 403, :error_name => 'invalid_key', :error_message => 'No key was passed or the passed key is invalid.' } and return
      end
    end

    def set_pagesize
      @pagesize = [params[:pagesize] || 10, 100].min
    end

    def has_more?(count, page)
      count > (page || 1) * @pagesize
    end

    def website_params
      params.require(:website).permit(:url, :post_count, :admin_id, :tech_id, :registrar_id)
    end

    def admin_params
      params.require(:admin).permit(:name, :org, :country, :email, :phone, :site_count)
    end

    def tech_params
      params.require(:tech).permit(:name, :org, :country, :email, :phone, :site_count)
    end

    def registrar_params
      params.require(:registrar).permit(:name, :url, :email, :phone, :site_count)
    end
end
