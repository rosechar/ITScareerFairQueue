class CompaniesController < ApplicationController
    before_action :set_event
    before_action :set_company, only: [:show, :edit, :destroy]
    
    def index
        redirect_to event_path(@event)
    end
    
    def show
        set_company
        @requests = @company.requests.all
    end
    
    def new
    end
    
    def edit
    end
    
    def create
        @company = @event.companies.create(company_params)
        if @company.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end
    
    def destroy
    end
    
    private
    
    def set_event
        @event = Event.find_by(slug: params[:event_id])
    end
    
    def set_company
        @company = @event.companies.find_by(slug: params[:id])
    end
    
    def company_params
        params.require(:company).permit(:name, :link , :summary, :iSponsor, :slug, :event_id)
    end
end
