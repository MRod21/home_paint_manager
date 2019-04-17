class UsersController < ApplicationController

  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    if @user.nil?
	    redirect '/'
    elsif current_user && @user.id == current_user.id
      @rooms = current_user.rooms
      binding.pry
      erb :"/users/show"
    else
      redirect "/users/#{current_user.id}"
   end
  end

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    @user = User.new(params)
    if @user.save
    session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
    redirect "/signup"
    end
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Welcome, #{@user.username}!"
      redirect "/users/#{@user.id}"
    else
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
