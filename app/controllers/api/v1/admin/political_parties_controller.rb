class Api::V1::Admin::PoliticalPartiesController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  skip_before_action :verify_authenticity_token

  before_action :authenticate_and_set_user

  def index
    render json: PoliticalParty.all.order(created_at: :desc)
  end

  def show
    render json: @political_party
  end

  def create
    party = PoliticalParty.new(political_party_params.merge(status: :pending))

    if party.save
      render json: party, status: :created
    else
      render json: { errors: party.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    party = PoliticalParty.find(params[:id])

    if party.update(political_party_params)
      render json: {
        message: 'Political Party updated successfully',
        party: party
      }, status: :ok
    else
      render json: {
        errors: party.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @political_party.destroy
    render json: { message: 'Political party deleted' }, status: :ok
  end

  def assign_representative
    party = PoliticalParty.find(params[:id])
    member = Member.find(params[:member_id])

    unless member.role_member == 'party_representative'
      return render json: { error: 'El miembro no es un representante válido' }, status: :unprocessable_entity
    end

    member.update!(political_party: party)

    render json: { message: 'Representante asignado correctamente', member: member }
  end

  def approve
    @political_party.update(status: :approved)
    render json: { message: 'Party approved', party: @political_party }
  end

  def reject
    @political_party.update(status: :rejected)
    render json: { message: 'Party rejected', party: @political_party }
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
