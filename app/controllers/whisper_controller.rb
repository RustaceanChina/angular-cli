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
      @