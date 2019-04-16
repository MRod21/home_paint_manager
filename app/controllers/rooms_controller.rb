class RoomsController < ApplicationController

  get "/rooms" do
    if !logged_in?
      redirect "/"
    else
      @rooms = current_user.rooms.all
      erb :"users/show"
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
      if @room.save
        redirect "/rooms/#{@room.id}"
      else
        redirect "/rooms/new"
      end
    end
    sleep 2
    redirect "users/#{current_user.id}"
  end

  get "/rooms/:id" do
    @room = Room.find_by(id: params[:id])
    erb :"/rooms/show"
  end

  get "/rooms/:id/edit" do
    @room = Room.find_by(id: params[:id])
    if @room.user_id == current_user.id
      erb :"/rooms/edit"
    else
      erb :"/users/#{current_user.id}"
    end
  end

  post "/rooms/:id/edit" do
    @room = Room.find_by(id: params[:id])
    @room.name = params[:name]
    @room.color = params[:color]
    @room.brand = params[:brand]
    @room.sheen = params[:sheen]
    @room.save
    redirect "/users/#{current_user.id}"
  end

  post "/rooms/:id/delete" do
    @room = current_user.rooms.find_by(id: params[:id])
    @room.destroy
    redirect "/users/#{current_user.id}"
  end
end
