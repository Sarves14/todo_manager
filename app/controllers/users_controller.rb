class UsersController < ApplicationController
  def new
    render "signup"
  end

  def index
    if User.all.length > 0
      list = User.all.to_a.map { |user| user.to_pleasant_string }
      render plain: list.join("\n")
    else
      render plain: "No Users in the database"
    end
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
