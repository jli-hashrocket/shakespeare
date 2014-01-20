class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order("name").page(params[:page])
    # @longest_speech = Speaker.longest_speech
  end
end
