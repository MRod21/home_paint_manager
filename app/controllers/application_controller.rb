require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "myhome"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
    #binding.pry
  end

  helpers do

    def logged_in?
      session.has_key?(:user_id)
    end

    def current_user
      User.find(session[:user_id])
    end

    def logout!
      session.clear
      redirect "/users/login"
    end

    def redirect_if_not_logged_in
			if !logged_in?
        redirect "/login"
      end
		end


  end

end
