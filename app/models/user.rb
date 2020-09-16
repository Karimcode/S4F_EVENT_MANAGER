class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :places

  has_many :daily_emotions, dependent: :destroy
  has_many :emotions, through: :daily_emotions, dependent: :destroy
  has_one :coach, dependent: :destroy


  def full_name
    "#{first_name} #{last_name}"
  end

  def coach?
    self.coach.present?
  end



end
