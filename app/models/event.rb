class Event < ApplicationRecord
  belongs_to :place
  has_many :daily_emotions, dependent: :destroy


    def start_time
      self.event_date
    end


end
