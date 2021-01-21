class Activity < ApplicationRecord

    has_many :daily_logs
    belongs_to :user, optional: true

    validates_presence_of :name
    validates_length_of :name, :maximum=>255
    validates_presence_of :goal
    validates_numericality_of :goal, :only_integer=>true
    validates_presence_of :units
    validates_length_of :units, :maximum=>30

end
