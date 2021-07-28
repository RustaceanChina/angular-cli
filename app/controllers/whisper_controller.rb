require 'category'

class WhisperController < ApplicationController

  before_action :check_for_user

  def index
  end

  def get_tweet
    if Tweet.for_whisper?
      @tweet = Tweet.for_whisper
    else
      add_more_tweets
      @tweet = Tweet.for_whisper
    end

    redirect_to whisper_tweet_path(id: @tweet.id)
  end

  def na
    @tweet = Tweet.find(params[:id])
    @tweet.update!(ignored: true)
    redirect_to whisper_get_tweet_path
  end

  def tweet
    @tweet = Tweet.find(params[:id])
    @categories = Category.all
  end

  def stop
    tweet = Tweet