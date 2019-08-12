class RequestsController < ApplicationController

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @company = @event.companies.find(params[:company_id])
    @request = @company.requests.create(request_params)
    if @request.save
        puts 'Request saved'
    else
        puts 'Request did not save'
    end
  end

  def destroy
    @event = Event.find_by(slug: params[:event_id])
    @company = @event.companies.find_by(slug: params[:company_id])
    @request = @company.requests.find(params[:id])
    @request.destroy

    redirect_to event_company_path(event_id: params[:event_id], id: @company)
    #redirect_to event_company_path(@company)
  end

private
  def request_params
      params.permit(:request, :event_id, :company_id, :user_id)
  end
end
