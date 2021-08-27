class BookingsController < ApplicationController
  before_action :new_booking, only: [:new, :create]
  before_action :find_booking, only: [:edit, :update]

  def index
    @bookings = Booking.all
    @property = Property.find(params[:property_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @property = Property.find(params[:property_id])
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
      redirect_to property_path(@property)
    else
      render :edit
    end
  end

  private

  def new_booking
    @property = Property.find(params[:property_id])
    # @booking = Booking.new(booking_params)
  end

  def find_booking
    @property = Property.find(params[:property_id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed)
  end
end
