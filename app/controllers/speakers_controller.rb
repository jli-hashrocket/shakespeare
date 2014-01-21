class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.page(params[:page])
    @longest_speeches = Speaker.longest_speech
  end
end
