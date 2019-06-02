class Organization < ApplicationRecord

    has_many :employees, :dependent => :destroy

    validates_presence_of :name
    validates_length_of :name, :maximum => 255, :allow_blank => false
end
