class Activity < ApplicationRecord

    has_many :daily_logs
    belongs_to :user, optional: true

end
