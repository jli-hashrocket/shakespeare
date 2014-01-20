class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order("name").page(params[:page])
    @lines = Speaker.number_of_lines
  end
end
