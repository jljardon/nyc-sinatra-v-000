class LandmarksController < ApplicationController
   get '/landmarks' do
      erb :'landmarks/index'
   end

   get '/landmarks/new' do
      erb :'landmarks/new'
   end

   post '/landmarks/new' do
      @landmark = Landmark.find_or_create_by(params[:landmark])
      erb :'landmarks/index'
   end

   get '/landmarks/:id' do
      @landmark = Landmark.find_by_id(params[:id])
      erb :'landmarks/show'
   end

   get '/landmarks/:id/edit' do
      @landmark = Landmark.find_by_id(params[:id])
      erb :'landmarks/edit'
   end

   patch '/landmarks/:id' do
      @landmark = Landmark.find_by_id(params[:id])
      @landmark.update(params[:landmark])
      @landmark.save
      redirect "landmarks/#{@landmark.id}"
   end
end
