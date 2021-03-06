class Event < ApplicationRecord

	validates :start_date, 
		presence: true

	validate :not_in_past?

  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0}
  
  validate :multiple_of_5?

  validates :title, 
  	presence: true, 
  	length: { in: 5..140 }

  validates :description, 
  	presence: true, 
  	length: { in: 20..1000 }

  validates :price, 
  	presence: true,
  	numericality: { only_integer: true,  in: 1..1000}
  
  validates :location, presence: true

  #validate :admin_cant_participate

	belongs_to :admin, class_name: "User"
	has_many :attendances
  has_many :participants, through: :attendances

  def is_free?
    return self.price == 0
  end

  def end_date
    return self.start_date + self.duration*60
  end

  def can_participate?(user)
    return !(user == nil || user == self.admin || self.participants.include?(user))
  end

  def admin?(user)
    return user == self.admin
  end

  def participate?(user)
    return self.participants.include?(user)
  end

  private

  def multiple_of_5?
  	if self.duration.present? && self.duration % 5 != 0
        errors.add(:duration, "must be multiple of 5")
    end
  end

  def not_in_past?  	
  	if self.start_date.present? && self.start_date < Time.now
        errors.add(:start_date, "can't be in the past")
    end
  end




end


