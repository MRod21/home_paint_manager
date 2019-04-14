class RoomsController < ApplicationController

  get "/rooms" do
    if !logged_in?
      redirect "/"
    else
      @rooms = current_user.rooms.all
      erb :"/index"
    end
  end

  get "/rooms/new" do
    redirect_if_not_logged_in
    @room = Room.new
    erb :"/rooms/new"
  end

  post "/rooms" do
    if !logged_in?
      redirect "/"
    else
      @room = current_user.rooms.new(params)
      binding.pry
      if @room.save
        redirect "/rooms/#{@room.id}"
      else
        redirect "/rooms/new"
      end
    end
  end

  get "/rooms/:id" do
    @room = Room.find_by(id: params[:id])
    erb :"/rooms/show"
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
