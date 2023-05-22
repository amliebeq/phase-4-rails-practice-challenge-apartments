class LeasesController < ApplicationController
    def destroy
        lease.find_by(id: params[:id]).destroy
    end

    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    private

    def lease_params
        params.permit(:number)
    end
end
