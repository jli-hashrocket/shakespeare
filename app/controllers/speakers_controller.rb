class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.page(params[:page])
    @longest_speeches = Speaker.longest_speech
    @scene_nums = Speaker.scene_numbers
  end
end
