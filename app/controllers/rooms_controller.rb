class RoomsController < ApplicationController

  get "/rooms" do
    if !logged_in?
      redirect "/"
    else
      @room = current_user.rooms.all
      erb :"rooms/index"
    end
  end

  get "/rooms/new" do
    redirect_if_not_logged_in
    @room = Room.new
    erb :"/rooms/new"
  end

  post "/rooms" do
    @room = current_user.rooms.new(params)
    if @room.save
      flash[:message] = "Succesfully created room!"
      erb :"/rooms/show"
    else
      redirect "/rooms/new"
    end
  end

  get "/rooms/:id" do
    @room = Room.find_by(id: params[:id])
    erb :"/rooms/show"
  end

  get "/rooms/:id/edit" do
    @room = Room.find_by_id(params[:id])
    if @room.user_id == current_user.id
      erb :"/rooms/edit"
    else
      redirect "/users/#{current_user.id}"
    end
  end

  patch "/rooms/:id" do
    @room = Room.find(params[:id])
    @room.update(name: params[:name], color: params[:color], brand: params[:brand], sheen: params[:sheen])
    flash[:message] = "Succesfully updated room!"
    redirect "/rooms/#{@room.id}"
  end

  delete "/rooms/:id" do
    @room = current_user.rooms.find_by(id: params[:id])
    @room.destroy
    flash[:message] = "Succesfully deleted room!"
    redirect "/rooms"
  end
end
