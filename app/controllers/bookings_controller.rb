class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @property = Property.find(params[:property_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @property = Property.find(params[:property_id])
    @booking.user = current_user
    @booking.property = @property
    if @booking.save!
      redirect_to property_path(@property), notice: 'Property was successfully booked.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
