class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes user_params
    redirect_to users_path
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end
private
  def user_params
    params.require(:user).permit(
      :name,
      :github,
      :admin,
      :email,
    )
  end
end
