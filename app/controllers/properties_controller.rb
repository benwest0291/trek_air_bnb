class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]

  def index
    @properties = Property.all

    if params[:query].present?
      @properties = Property.near(params[:query])
    end

    @markers = @properties.geocoded.map do |property|
    {
    lat: property.latitude,
    lng: property.longitude,
    info_window: render_to_string(partial: "info_window", locals: { property: property }),
    image_url: helpers.asset_url('marker2.png')
    }
    end
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property), notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @property.update(property_params)
    if @property.save
      redirect_to property_path(@property), notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :name, :image_url, :postcode, :price, :description, :user_id, :wifi, :kitchen, :bathroom, :dog_friendly, :number_beds, :air_defense)
  end
end
