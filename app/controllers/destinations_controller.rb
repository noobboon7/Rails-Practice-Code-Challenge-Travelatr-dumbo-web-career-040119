class DestinationsController < ApplicationController
  before_action :destination_post, only: [:show]
  def index
    @destinations = Destination.all
  end

  private

  def destination_post
    @destination = Destination.find(params[:id])
  end

  def destination_params(*args)
    params.require(:destination).permit(*args)
  end

end
