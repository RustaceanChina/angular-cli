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
    tweet = Tweet.find(params[:id])
    tweet.update!(in_use: false)
    redirect_to dashboard_path
  end

  def category
    @tweet = Tweet.find(params[:id])
    @category = Category.find(params[:category])
  end

  def subcategory
    Tweet.find(params[:id]).update!(category_slug: params[:subcategory])

    redirect_to whisper_get_tweet_path
  end

  protected

  def add_more_tweets
    Tweet.add_tweets_for_user(current_user)
  end
end
