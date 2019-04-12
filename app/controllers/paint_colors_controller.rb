class PaintColorsController < ApplicationController

  # GET: /paint_oolors
  get "/paint_oolors" do
    erb :"/paint_oolors/index.html"
  end

  # GET: /paint_oolors/new
  get "/paint_oolors/new" do
    erb :"/paint_oolors/new.html"
  end

  # POST: /paint_oolors
  post "/paint_oolors" do
    redirect "/paint_oolors"
  end

  # GET: /paint_oolors/5
  get "/paint_oolors/:id" do
    erb :"/paint_oolors/show.html"
  end

  # GET: /paint_oolors/5/edit
  get "/paint_oolors/:id/edit" do
    erb :"/paint_oolors/edit.html"
  end

  # PATCH: /paint_oolors/5
  patch "/paint_oolors/:id" do
    redirect "/paint_oolors/:id"
  end

  # DELETE: /paint_oolors/5/delete
  delete "/paint_oolors/:id/delete" do
    redirect "/paint_oolors"
  end
end
