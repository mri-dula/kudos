class Employee < ApplicationRecord

    belongs_to :user

    has_many :kudos_given, :foreign_key => 'from_id', :class_name => Kudo.name
    has_many :kudos_received, :foreign_key => 'to_id', :class_name => Kudo.name

    validates_presence_of :full_name
    validates_length_of :full_name, :maximum => 255, :allow_blank => false

    def kudos_left_for_the_week
        assumed_timezone = tz = TZInfo::Timezone.get(Rails.application.config.assumed_timezone)
        now = DateTime.now.in_time_zone assumed_timezone
        Kudo::MAX_PER_WEEK - kudos_given.where('created_at >= ? AND created_at <= ?', now.beginning_of_week, now.end_of_week).count        
    end

    def can_give_kudos_now?
        kudos_left_for_the_week > 0
    end

end
