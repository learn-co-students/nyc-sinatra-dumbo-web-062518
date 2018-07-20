class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  post '/figures' do
    figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      title = Title.create(params["title"])
      # titles = figure.titles
      # titles << title
      figure.titles << title
    end
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(params["landmark"])
      # landmarks = figure.landmarks
      # landmarks << landmark
      figure.landmarks << landmark
    end
    # binding.pry
    redirect to '/figures'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params["figure"])
    if !params["title"]["name"].empty?
      title = Title.create(params["title"])
      figure.titles << title
    end
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(params["landmark"])
      figure.landmarks << landmark
    end
    redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end
end
