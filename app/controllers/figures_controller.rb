class FiguresController < ApplicationController

  get '/figures' do
    erb :"figures/index"
  end
  
  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.titles << Title.create(params[:title]) if params[:title][:name] != ""
    figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name] != ""
    redirect '/figures'
  end
  
  get '/figures/new' do
    erb :"figures/new"
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.titles << Title.create(params[:title]) if params[:title][:name] != ""
    figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name] != ""
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

end