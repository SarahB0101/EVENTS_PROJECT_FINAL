class Attendance < ApplicationRecord
	
	belongs_to :participant, class_name: "User"
	belongs_to :event

	after_create :new_participant_send
	
	#validates_uniqueness_of :participant_id, :scope => [:event_id]
	#validates :stripe_id_coherent?


	def new_participant_send
    	UserMailer.new_participant_email(self).deliver_now
  	end



#private

	# def stripe_id_coherent?
	# 	e_price = Event.find(event_id).price
	# 	unless ((e_price == 0 && stripe_customer_id == nil)||(e_price !=0 && stripe_customer_id != nil))
	# 	  errors.add(:strip_customer_id, "Ne peut être vide que pour les événement gratuit.")
	# 	end
	# end


end
