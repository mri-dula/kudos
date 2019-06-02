class User < ApplicationRecord
    devise :database_authenticatable, :validatable

    has_one :employee, :dependent => :restrict_with_error
end
