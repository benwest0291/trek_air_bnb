class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit]
  def index
    @property = Property.all
  end

  def show
    @property = Property.find(params[:id])
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
    @propery = Propery.find(params[:id])
  end

  def update
    raise params.inspect
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
    params.require(:property).permit(:name)
  end
end
