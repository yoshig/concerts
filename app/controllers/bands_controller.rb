class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = current_user.build_band(band_params)
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
