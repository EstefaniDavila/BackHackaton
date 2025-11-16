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
    @events = Event.where(political_party: political_party)
  end

  def by_general
    @events = Event.where(political_party_id: nil)
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
