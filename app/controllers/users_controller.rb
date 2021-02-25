class UsersController < ApplicationController
  skip_before_action :ensure_signin

  def new
  end

  def index
    render "signup"
  end

  def create
    User.create!(first_name: params[:first_name],
                 last_name: params[:last_name],
                 email: params[:email],
                 password: params[:password])
    redirect_to "/"
  end
end
