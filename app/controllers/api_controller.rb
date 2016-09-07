class ApiController < ApplicationController
  before_action :verify_key
  before_action :set_pagesize, :only => [:websites, :admins, :techs, :registrars]
  skip_before_action :verify_authenticity_token, :only => [:create_website, :create_admin, :create_tech, :create_registrar]

  # Write methods

  def create_website
    @website = Website.where(website_params).first_or_create
    if @website.save
      @website.admin.site_count += 1
      @website.admin.save!

      @website.tech.site_count += 1
      @website.tech.save!

      @website.registrar.site_count += 1
      @website.registrar.save!
    else
      unless @website.valid?
        render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the website from being saved.', :messages => @website.errors.full_messages }
      else
        render :status => 400, :json => { :error_code => 400, :error_name => 'failed_validation', :error_message => 'The object created fails validation.', :messages => @website.errors.full_messages }
      end
    end
  end

  def create_admin
    @admin = Admin.where(admin_params).first_or_create
    unless @admin.save
      unless @admin.valid?
        render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the admin from being saved.', :messages => @admin.errors.full_messages }
      else
        render :status => 400, :json => { :error_code => 400, :error_name => 'failed_validation', :error_message => 'The object created fails validation.', :messages => @admin.errors.full_messages }
      end
    end
  end

  def create_tech
    @tech = Tech.where(tech_params).first_or_create
    unless @tech.save
      unless @tech.valid?
        render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the tech from being saved.', :messages => @tech.errors.full_messages }
      else
        render :status => 400, :json => { :error_code => 400, :error_name => 'failed_validation', :error_message => 'The object created fails validation.', :messages => @tech.errors.full_messages }
      end
    end
  end

  def create_registrar
    @registrar = Registrar.where(registrar_params).first_or_create
    unless @registrar.save
      unless @registrar.valid?
        render :status => 500, :json => { :error_code => 500, :error_name => 'internal', :error_message => 'An internal error prevented the registrar from being saved.', :messages => @registrar.errors.full_messages }
      else
        render :status => 400, :json => { :error_code => 400, :error_name => 'failed_validation', :error_message => 'The object created fails validation.', :messages => @registrar.errors.full_messages }
      end
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
    @registrars = Registrar.order(:created_at => :desc)
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
      params.require(:website).permit(:url, :name_server, :post_count, :admin_id, :tech_id, :registrar_id)
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
