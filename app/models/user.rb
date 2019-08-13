class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
  has_many :administrated_events, foreign_key: 'admin_id', class_name: "Event"
	
  has_many :attendances, foreign_key: 'participant_id'
  has_many :events, through: :attendances

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def name
  	return "#{first_name} #{last_name}"
  end
end
