class EventsController < ApplicationController

	before_action :find_event, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@events = Event.all.order("created_at DESC")
	end

	def show
		@events = Event.where(event_id: @event)

	end

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)

		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event.destroy
		redirect_to root_path
	end

	private

	def find_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title, :description, :calendar_entry, :image)
	end

end
