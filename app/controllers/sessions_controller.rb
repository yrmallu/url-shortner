class SessionsController < ApplicationController
  before_action :authorize, only: [:destroy]

  def new
    # TODO: This is not good way to use.
    #   We need to add something there..
    if logged_in?
      redirect_to root_path
    else
      render 'sessions/new'
    end
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = t 'session.logged_in_ok'
      redirect_to admin_index_path
    else
      flash[:danger] = t 'error.invalid_combination'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = t 'session.logged_out_ok'
    redirect_to root_path
  end
end
