class DailyEmotion < ApplicationRecord
  belongs_to :emotion
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :emotion_id, scope: [:user_id, :event_id]





    def start_time
      # self.created_at
      Event.find(self.event_id).event_date
      # User.find(self.user_id).event_date

      # self.event_id.event_date

    end

  def color
    num = self
    case num
    when 1 then '#F25855'
    when 2 then '#F7955F'
    when 3 then '#F7B363'
    when 4 then '#F7D167'
    when 5 then '#ABD682'
    end
  end
end
