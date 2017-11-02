class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :"landmarks/index"
  end
  
  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    # landmark.titles << Title.create(params[:title]) if params[:title][:name] != ""
    # landmark.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name] != ""
    redirect '/landmarks'
  end
  
  get '/landmarks/new' do
    erb :"landmarks/new"
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    # landmark.titles << Title.create(params[:title]) if params[:title][:name] != ""
    # landmark.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name] != ""
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

end
