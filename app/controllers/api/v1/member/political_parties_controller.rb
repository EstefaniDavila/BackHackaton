class Api::V1::Member::PoliticalPartiesController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def index
    parties = PoliticalParty.all.order(created_at: :desc)

    result = parties.map do |party|
      president = party.candidates.find_by(position_type: :presidential)
      {
        id: party.id,
        name: party.name,
        acronym: party.acronym,
        logo: party.logo.attached? ? url_for(party.logo) : nil,
        president_id: president ? president.id : nil,
        president_name: president ? president.full_name : nil,
        representative: party.member ? { id: party.member.id, full_name: party.member.full_name } : nil
      }
    end
    render json: result, status: :ok
  end
 
  def show
    render json: @political_party
  end

  private

  def set_political_party
    @political_party = PoliticalParty.find(params[:id])
  end

  def political_party_params
    params.require(:political_party).permit(
      :name,
      :acronym,
      :description,
      :founded_at,
      :hq_address,
      :website,
      :facebook_url,
      :twitter_url,
      :instagram_url,
      :youtube_url,
      :tiktok_url
    )
  end
end
