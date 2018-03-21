class FiguresController < ApplicationController
   get '/figures' do
      erb :'figures/index'
   end

   get '/figures/new' do
      erb :'figures/new'
   end

   get '/figures/:id/edit' do
      @figure = Figure.find_by_id(params[:id])
      erb :'figures/edit'
   end

   patch '/figures/:id' do
      @figure = Figure.find_by_id(params[:id])
      @figure.update(params[:figure])

      unless params[:landmark][:name].empty?
         @figure.landmarks.push(Landmark.create(params[:landmark]))
      end

      unless params[:title][:name].empty?
         @figure.titles.push(Title.create(params[:title]))
      end

      @figure.save

      redirect "figures/#{@figure.id}"
   end

   get '/figures/:id' do
      @figure = Figure.find_by(params[:id])
      erb :'figures/show'
   end

   post '/figures/new' do
      @figure = Figure.create(params[:figure])

      # creates a title in case params[:title] has info
      unless params[:title][:name].empty?
         @figure.titles.push(Title.create(name: params[:title][:name]))
      end

      unless params[:landmark][:name].empty?
         @figure.landmarks.push(Landmark.create(name: params[:landmark][:name]))
      end

      @figure.save

      erb :'figures/index'
   end
end
