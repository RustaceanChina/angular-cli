
class WwwController < ApplicationController

  before_action :check_for_user, only: [:dashboard]

  def index
  end

  def about
  end

  def dashboard
  end

  def projects
  end

  def whisper
  end

end