class SessionsController < ApplicationController

  def new
  end

  def create
    # raise params.inspect
    user = User.find_by(name: params[:user][:name])
    if user and user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new, alert: "Wrong name or password"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
