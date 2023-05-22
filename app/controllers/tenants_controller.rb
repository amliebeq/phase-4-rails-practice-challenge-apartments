class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            render json: tenant.update(tenant_params), status: :created
        else
            render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    def destroy
        tenant.find_by(id: params[:id]).destroy
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
end
