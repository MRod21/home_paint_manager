class RoomsController < ApplicationController

  get "/rooms" do
    redirect_if_not_logged_in
    @rooms = current_user.rooms.all
    erb :"/index"
  end

  get "/rooms/new" do
    redirect_if_not_logged_in
    @room = Room.new
    erb :"/rooms/new"
  end

  # POST: /rooms
  post "/rooms" do
    redirect "/rooms"
  end

  # GET: /rooms/5
  get "/rooms/:id" do
    erb :"/rooms/show.html"
  end

  # GET: /rooms/5/edit
  get "/rooms/:id/edit" do
    erb :"/rooms/edit.html"
  end

  # PATCH: /rooms/5
  patch "/rooms/:id" do
    redirect "/rooms/:id"
  end

  # DELETE: /rooms/5/delete
  delete "/rooms/:id/delete" do
    redirect "/rooms"
  end
end
