class OrganizationSubdomainConstraint
  def self.matches?(request)
      request.subdomain.present? && Organization.pluck(:subdomain).include?(request.subdomain)
  end
end

class AdminSubdomainConstraint
  def self.matches?(request)
      request.subdomain.blank?
  end
end

Rails.application.routes.draw do

  devise_for :users
  

  constraints OrganizationSubdomainConstraint do 
    root to: 'home#index'
    resources :kudos, :only => [] 

    namespace :profile do 
      resources :kudos, :only => [:create]  do 
        collection do 
          get :given
          get :received
        end
      end
    end
  end

  constraints AdminSubdomainConstraint do 
    scope :module => :admin do 
      root to: 'seed_data#show'
      #resource :seed_data, :only => [:show]
    end
  end

  

end
