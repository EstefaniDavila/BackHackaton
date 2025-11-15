class Api::V1::Admin::MembersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index_select
        members = Member.where(role_member: 'party_representative')
        members = members.where(partner_id: params[:partner_id]) if params[:partner_id].present?

        render json: members.select(:id, :full_name), status: :ok
    end
end
