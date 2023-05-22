class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    def create
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment.update(apartment_params), status: :created
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    def destroy
        Apartment.find_by(id: params[:id]).destroy
    end

    private

    def apartment_params
        params.permit(:number)
    end
end
