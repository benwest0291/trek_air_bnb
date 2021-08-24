class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]
  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property
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

  # # def destroy
  #   @property.destroy
  #   redirect_tp properties_url, notice: 'The property was successfully destroyed'
  # end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :postcode, :price, :description, :user_id, :wifi, :kitchen, :bathroom, :dog_friendly, :number_beds, :air_defense)
  end
end
