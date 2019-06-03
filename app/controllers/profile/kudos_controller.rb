class Profile::KudosController < ApplicationController

    def create
        @kudo = Kudo.new create_params
        @kudo.from = current_user.employee
        if @kudo.save then 
            flash[:notice] = I18n.t('messages.kudos_saved_successfully', :to_name => @kudo.to.full_name)
            redirect_to given_profile_kudos_path
        else 
            flash[:multiple_errors] = @kudo.errors.full_messages
            redirect_to root_path
        end
    end

    def given
        @kudos = current_user.employee.kudos_given.order(created_at: :desc)
    end

    def received
        @kudos = current_user.employee.kudos_received.order(created_at: :desc)
    end

    private

    def create_params
        params.require(:kudo).permit(:to_id, :message)
    end
end
