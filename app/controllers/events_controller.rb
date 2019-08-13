class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new		
	end

	def create
		@event = Event.new(event_params)
		@event.admin = current_user
	end

	def edit
		
	end

	def update
		@event.update(event_params)
	end

	def destroy
		@event.destroy
	end
	

	private

	def set_event
      @event = Event.find(params[:id])
    end

	def event_params
		params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
	end
end
