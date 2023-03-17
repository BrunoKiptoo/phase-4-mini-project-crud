class SpicesController < ApplicationController

# GET /spices: return an array of all spices

    def index
        spices = Spice.all
        render json: spices
    end

# GET /spices/:id: return one spice
def show
    spice = find_spice
    render json: spice
end


# POST /spices: create a new spice

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
# PATCH /spices/:id: update an existing spice

    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render_error_response
        end
    end
# DELETE /spices/:id: delete an existing spice

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.destroy
            head :no_content
        else
           render_error_response
        end
    end

    private 
    def spice_params
        params.permit(:title, :description, :image, :notes, :rating)

    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def render_error_response
        render json: {error: "Spice not found"}, status: :unprocessable_entity
    end
end
