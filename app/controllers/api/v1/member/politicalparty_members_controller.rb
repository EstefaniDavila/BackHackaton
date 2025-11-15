class Api::V1::Member::PoliticalPartyMemberController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def show
    member_id = params[:id]
    records = PoliticalPartyMember.where(member_id: member_id)
    render json: records, status: :ok
  end

  def create
    politicalpartymember = PoliticalPartyMember.new(politicalparty_members_params)
    if politicalpartymember.save
      render json: { message: "Suscripcion realizada con éxito" }, status: :ok
    else
      render json: { message: "Ocurrió un error al suscribirse", errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    politicalpartymember =PoliticalPartyMember.find(params[:id])
    if politicalpartymember.destroy
      render json: {message: "Suscripcion cancelada con exito"}, status: :ok
    else
      render json: {message: "Ocurrió un error al cancelar la subscripcion"}, status: :unprocessable_entity
    end
  end

  def politicalparty_members_params
    params.require(:politicalparty_members).permit(:political_party_id, :member_id)
  end

  private
end
