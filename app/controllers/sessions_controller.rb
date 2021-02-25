class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    print user.email
    if user.authenticate(params[:password])
      print "Signed in"
      redirect_to todos_path
    else
      print "Wrong password"
      redirect_to "/"
    end
  end
end
