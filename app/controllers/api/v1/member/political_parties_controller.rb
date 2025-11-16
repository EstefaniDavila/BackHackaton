class Api::V1::Member::PoliticalPartiesController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def index
    parties = PoliticalParty.all.order(created_at: :desc)

    result = parties.map do |party|
      {
        id: party.id,
        name: party.name,
        acronym: party.acronym,
        logo: party.logo,
        #presidente
        # Todos los representantes del partido
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
