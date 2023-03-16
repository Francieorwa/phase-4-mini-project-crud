class SpicesController < ApplicationController
    wrap_parameters format: []
  
    def index
      spices = Spice.all
      render json: spices
    end
  
    def create
      spice = Spice.create(spice_params)
      if spice.save
        render json: spice, status: :created
      else
        render json: { error: "Unable to create spice" }, status: :unprocessable_entity
      end
    end
  
    def update
      spice = Spice.find_by(id: params[:id])
      if spice.update(spice_params)
        render json: spice
      else
        render json: { error: "Unable to update spice" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      spice = Spice.find_by(id: params[:id])
      if spice.destroy
        render json: { message: "Spice successfully deleted" }
      else
        render json: { error: "Unable to delete spice" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating, :is_in_stock)
    end
  end
  
