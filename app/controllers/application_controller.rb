require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrets, "myhome"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/users/signup"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logout!
      session.clear
      redirect "/users/login"
    end

  end

end
