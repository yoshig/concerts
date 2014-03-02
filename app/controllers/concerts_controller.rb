class ConcertsController < ApplicationController
  def index
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @concert = @tour.concerts.build(concert_params)
    flash[:errors] = @concert.errors.full_messages unless @concert.save
    redirect_to tour_url(@tour)
  end

  def destroy
    concert = Concert.find(params[:id])
    redirect_to tour_url(Tour.find(params[:tour_id])) if concert.destroy
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def update
    @concert = Concert.find(params[:id])
    if @concert.update(concert_params)
      redirect_to concert_url(@concert)
    else
      flash[:errors] = @concert.errors.full_messages
      redirect_to concert_url(@concert)
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:location, :date)
  end

end
