class SpicesController < ApplicationController
   
    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spices = Spice.find_by(id: params[:id])
        render json: spices
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end

    def create
        spices = Spice.create(params.permit(:title, :image, :description, :notes, :rating))
        render json: spices, status: :created
    end

    def update
        spices = Spice.find_by(id: params[:id])
        spices.update(params.permit(:title, :image, :description, :notes, :rating))
        render json: spices
    end
    def destroy
        spices = Spice.find_by(id: params[:id])
        spices.destroy
        head :no_content
    end


    private

    def render_not_found_response
        render json: { error: "Bird not found" }, status: :not_found
    end

end
