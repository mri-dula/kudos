class Admin::SeedDataController < ApplicationController
    skip_before_action :set_current_organization 
    skip_before_action :authenticate_user!

    layout 'admin'
    def show
        
    end
end
