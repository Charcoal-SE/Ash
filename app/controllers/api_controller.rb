class ApiController < ApplicationController
  before_action :verify_key

  # Write methods

  def create_website
  end

  def create_admin
  end

  def create_tech
  end

  def create_registrar
  end

  # Read methods

  def websites
  end

  def admins
  end

  def techs
  end

  def registrars
  end

  private
    def verify_key
      @key = ApiKey.find_by_key params[:key]
      unless params[:key].present? && @key.present?
        render :status => 403, :json => { :error_code => 403, :error_name => 'invalid_key', :error_message => 'No key was passed or the passed key is invalid.' } and return
      end
    end
end
