class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.page(params[:page])
    @scene_nums = Speaker.scene_numbers
  end
end
