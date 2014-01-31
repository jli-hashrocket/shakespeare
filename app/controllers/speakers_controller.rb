class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.page(params[:page])
  end
end
