class SessionsController < ApplicationController
  skip_before_action :ensure_signin

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    print user.email
    if user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      print "Wrong password"
      redirect_to "/"
    end
  end
end
