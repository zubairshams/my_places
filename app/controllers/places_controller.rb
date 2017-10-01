class PlacesController < ApplicationController
  before_action :prepare_place, only: [:show, :edit, :update, :destroy]
  
  def index
    @places = current_user.places.order('created_at DESC')
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user

    if @place.save
      flash[:success] = "Place added!"
      redirect_to place_path(@place), notice: 'Place added.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place), notice: 'Place updated.'
    else
      render :form
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path, notice: 'Place deleted'
  end  

  private

  def prepare_place
    @place = Place.find(params[:id])
  end  

  def place_params
    params.require(:place).permit(:title, :address)
  end
end
