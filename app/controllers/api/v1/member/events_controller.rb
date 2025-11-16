class Api::V1::Member::EventsController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def index
    @events = Event.all
  end

  def by_political_party
    political_party = params[:political_party]
    @events = Event.where(political_party_id: political_party)
    render json: @events
  end

  def by_general
    @events = Event.where(political_party_id: nil)
    render json: @events
  end

  def index_for_mesa
    @events = Event.all
    render json: @events
  end

  def member_for_city
    @events = Event.where.not(type_member: :members)
    render json: @events
  end

  private

  def event_params
    params.require(:event).permit(
      :tittle,
      :date,
      :description,
      :type_member,
      :political_party_id
    )
  end
end
