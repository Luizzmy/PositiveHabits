class DailyLog < ApplicationRecord

    belongs_to:activity

    validates_length_of :comments, :maximum=>255
    validates_presence_of :achieved
    validates_numericality_of :achieved, :only_integer=>true

end
