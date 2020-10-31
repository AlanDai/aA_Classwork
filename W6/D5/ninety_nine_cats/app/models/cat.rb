require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = ['Brown', 'Black', 'Orange', 'White', 'Funky']

    validates :birth_date, :color, :sex, :name, presence: true
    validates :color, inclusion: { in: COLORS }
    validates :sex, inclusion: { in: %w(M F) }
    # Inclusion examples:
    #   validates :language, :presence => true, :inclusion => { :in => %(en fr es)}
    #   validates :size, inclusion: { in: %w(small medium large)
    
    def age
        # today = Date.today
        # cat_age = today.year - birth_date.year
        # temp_date = Date.new(today.year, birth_date.mon, birth_date.day)
        # cat_age -= 1 if (temp_date <=> today) == 1
        # cat_age

        time_ago_in_words(birth_date)
    end
end
