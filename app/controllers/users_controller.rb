class UsersController < ApplicationController
  def find
    @users = User.where('username LIKE ?', "%#{params[:q]}%").order(:username)
    count = @users.count
    @users = @users.paginate(:page => params[:page], :per_page => 20)
    render :json => { :items => @users, :has_more => (count > (params[:page] || 1) * 20) }
  end
end
