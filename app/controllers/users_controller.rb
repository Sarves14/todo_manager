class UsersController < ApplicationController
  skip_before_action :ensure_signin

  def new
  end

  def index
    render "signup"
  end

  def create
    user = User.create!(first_name: params[:first_name],
                        last_name: params[:last_name],
                        email: params[:email],
                        password: params[:password])
    session[:current_user_id] = user.id
    redirect_to "/"
  end
end
