class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

  post '/new' do
    #@tweet = current_user.tweets.build(content: params[:content])
    if params[:content].empty?
      redirect '/tweets/new'
    else
      @tweet = Tweet.create(content: params[:content], user_id: current_user.id)
      redirect "/tweets"
    end
  end

  get '/tweet/:id' do

    @tweet = Tweet.find(params[:id])
    erb :'tweets/show'
  end

end
