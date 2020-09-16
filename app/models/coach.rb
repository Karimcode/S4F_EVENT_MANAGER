class Coach < ApplicationRecord
  belongs_to :user


  def full_name
    User.find("#{user_id}").first_name + "   " + User.find("#{user_id}").last_name
  end

end
