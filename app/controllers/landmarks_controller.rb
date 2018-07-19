class LandmarksController < ApplicationController

  get '/' do
    landing
  end

  get '/landmarks' do

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  post '/landmarks' do
    binding.pry
    @landmark = Landmark.create(params)

    redirect to :"/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.all.find(params[:id])
    erb :'/landmarks/show'
  end


end
