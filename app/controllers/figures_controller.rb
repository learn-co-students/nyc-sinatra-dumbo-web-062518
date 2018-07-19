class FiguresController < ApplicationController

  get '/' do
    landing
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
# binding.pry
    if params[:figure][:title_ids] != nil
    params[:figure][:title_ids].each do |title|
      FigureTitle.find_or_create_by(figure_id: @figure.id, title_id: title)
    end
  end

    if !params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    end
    @figure.save

    if params[:figure][:landmark_ids] != nil
    params[:figure][:landmark_ids].each do |lm_id|
      Landmark.find(lm_id).update(figure_id: @figure.id)
    end
  end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"], figure_id: @figure.id, year_completed: params["landmark"]["year_completed"])
    end

    @figure.save

    redirect to :"/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do

    @figure = Figure.find(params[:id])

    erb :'/figures/edit'
  end

  get '/figures/:id' do

    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  patch "/figures" do

    @figure = Figure.create(params[:figure])
# binding.pry
    if params[:figure][:title_ids] != nil
    params[:figure][:title_ids].each do |title|
      FigureTitle.find_or_create_by(figure_id: @figure.id, title_id: title)
    end
  end

    if !params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    end
    @figure.save

    if params[:figure][:landmark_ids] != nil
    params[:figure][:landmark_ids].each do |lm_id|
      Landmark.find(lm_id).update(figure_id: @figure.id)
    end
  end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"], figure_id: @figure.id, year_completed: params["landmark"]["year_completed"])
    end

    @figure.save

    redirect to :"/figures/#{@figure.id}"

  end



end
