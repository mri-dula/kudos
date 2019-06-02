class HomeController < ApplicationController
    def index
        @kudo = Kudo.new(from: current_user.employee)
    end
end
