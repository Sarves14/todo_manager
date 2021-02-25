class UsersController < ApplicationController
  def new
  end

  def index
    render "signup"
  end

  def show
    id = params[:id]
    user = User.find_by(id: id)
    render plain: (user == nil ? "No User with the given id" : user.to_pleasant_string)
  end

  def create
    User.create!(first_name: params[:first_name],
                 last_name: params[:last_name],
                 email: params[:email],
                 password: params[:password])
    redirect_to "/"
  end

  def login
    user = User.find_by(email: params[:email])
    if user == nil
      response = { :status => false }
    else
      if user.password == params[:password]
        response = { :status => true }
      else
        response = { :status => false }
      end
    end
    respond_to do |format|
      format.json { render :json => response }
    end
  end
end
