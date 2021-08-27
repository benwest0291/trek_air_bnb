class BookingsController < ApplicationController
  before_action :new_booking, only: [:new, :create]
  before_action :find_booking, only: [:edit, :update]

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @properties = Property.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.property = @property
    if @booking.save!
      redirect_to property_booking_path(@property, @booking), notice: 'Property was successfully booked.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @property.user = current_user
    @booking.property = @property
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def new_booking
    @property = Property.find(params[:property_id])
  end

  def find_booking
    @property = Property.find(params[:property_id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed)
  end
end
