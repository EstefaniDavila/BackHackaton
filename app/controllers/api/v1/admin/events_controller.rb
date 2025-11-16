class Api::V1::Admin::EventsController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def index
    events = Event.all
    total_records = events.count
    events = events.page(params[:page]).per(params[:per_page])

    render json: {
      events: events.as_json,
      current_page: events.current_page,
      total_pages: events.total_pages,
      per_pages: events.limit_value,
      total_events: total_records
    }, status: :ok
  end

  def by_political_party
    political_party = params[:political_party]
    events = Event.where(political_party: political_party)
    total_records = events.count
    events = events.page(params[:page]).per(params[:per_page])

    render json: {
      events: events.as_json,
      current_page: events.current_page,
      total_pages: events.total_pages,
      per_pages: events.limit_value,
      total_events: total_records
    }, status: :ok
  end

  def by_general
    events = Event.where(political_party_id: nil)
    total_records = events.count
    events = events.page(params[:page]).per(params[:per_page])

    render json: {
      events: events.as_json,
      current_page: events.current_page,
      total_pages: events.total_pages,
      per_pages: events.limit_value,
      total_events: total_records
    }, status: :ok
  end

  def create
    
    event = Event.new(event_params)
    if event.save
      render json: { message: 'Evento Creado con exito' }, status: :ok
    else
      render json: { message: 'Ocurrió un error al registrar el evento', errors: event.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    event = Event.find(params[:id])

    if event.update(event_params)
      render json: {
        message: 'Event updated successfully',
        event: event.as_json
      }, status: :ok
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      render json: { message: 'Event deleted' }, status: :ok
    else
      render json: { message: 'Error on event deleted' }, status: :ok
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :tittle,
      :date,
      :description,
      :type_member
    )
  end
end
