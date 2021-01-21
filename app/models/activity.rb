class Activity < ApplicationRecord

    has_many :daily_logs
    belongs_to :user, optional: true

    validates_presence_of :name
    validates_presence_of :goal
    validates_presence_of :units

end
