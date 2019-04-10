class RoomsController < ApplicationController

  # GET: /rooms
  get "/rooms" do
    erb :"/rooms/index.html"
  end

  # GET: /rooms/new
  get "/rooms/new" do
    erb :"/rooms/new.html"
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
