class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order("name").page(params[:page])
  end
end
