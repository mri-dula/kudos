class Kudo < ApplicationRecord
    MAX_PER_WEEK = 3

    belongs_to :from, :class_name => Employee.name
    belongs_to :to, :class_name => Employee.name

    validate :should_not_exceed_per_week_limit
    validate :to_and_from_cannot_be_same

    validates_length_of :message, :maximum => 255, :allow_blank => true

    private

    def should_not_exceed_per_week_limit
        if from.present? then 
            errors.add(:base, :employee_has_exceeded_kudos_limit) unless from.can_give_kudos_now?
        end
    end

    def to_and_from_cannot_be_same
        if from.present? || to.present? then 
            errors.add(:base, :to_and_from_cannot_be_same) if to == from
        end
    end
end
