class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :destroy]

  def index
    if !current_user
        redirect_to login_path
    end
    
    @events = Event.all
  end

  def show
    set_event
  end

  def new
  end

  def create
    @event = Event.new(event_params)

    @event.save
    redirect_to @event
  end

  def edit
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :link, :description, :slug)
  end

  def set_event
    @event = Event.find_by(slug: params[:id])
  end
end
