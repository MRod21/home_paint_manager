class UsersController < ApplicationController

  get "/users" do
    erb :"/users/index"
  end

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    @user = User.new(params)
    if user.save
      sessions[:user_id]= user.id
      redirect "/users/#{user.id}"
    else
    redirect "/users/failed"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    binding.pry
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
