class ToursController < ApplicationController
  def new
    @tour = Tour.new
  end

  def index
  end

  def create
    @tour = current_user.band.tours.build(tour_params)
    if params.include?(:update_dates)
      render "new"
    else
      @concerts = @tour.concerts.build(concert_params)
      if @tour.save
        redirect_to tour_url(@tour)
      else
        flash.now[:errors] = @tour.errors.full_messages
        render "new"
      end
    end
  end

  def edit

  end

  def show
    @tour = Tour.find(params[:id])
    @concert = Concert.new
    render "show"
  end

  def update
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :start_date, :end_date)
  end

  def concert_params
    params.permit(:concert => [:location, :date])
          .require(:concert)
          .values
          .reject { |concert| concert["location"].blank? }
  end
end
