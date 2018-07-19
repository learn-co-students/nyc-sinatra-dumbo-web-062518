class FiguresController < ApplicationController

  get '/' do
    landing
  end

  get '/figures' do

    erb :'figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  get 'figures/:id/edit' do

    erb :'figures/edit'
  end

  get '/figures/:id' do

    erb :'figures/show'
  end



end
