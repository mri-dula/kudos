class ApplicationController < ActionController::Base
    before_action :set_current_organization
    before_action :authenticate_user!
    

    add_flash_types :error, :multiple_errors
    layout :layout_by_resource

    private

    def layout_by_resource
        if devise_controller?
            "devise"
        else
            "application"
        end
    end

    def set_current_organization
        @current_organization = Organization.find_by(subdomain: Apartment::Tenant.current)
    end
end
