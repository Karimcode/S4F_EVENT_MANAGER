class Event < ApplicationRecord
  belongs_to :place


    def start_time
      self.event_date
    end


end
