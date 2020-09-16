class Emotion < ApplicationRecord
  has_many :daily_emotions
  validates :rating, presence: true
  enum rating: { "😞" => 1,
                 "😕" => 2,
                 "😐" => 3,
                 "🙂" => 4,
                 "😁" => 5 }
  def name
    rating
  end

  def number
    rating_hash = { "😞" => 1,
                 "😕" => 2,
                 "😐" => 3,
                 "🙂" => 4,
                 "😁" => 5 }
    rating_hash[self.rating]
  end

  def color
    num = self.number
    case num
    when 1 then '#F25855'
    when 2 then '#F7955F'
    when 3 then '#F7B363'
    when 4 then '#F7D167'
    when 5 then '#ABD682'
    end
  end
end
