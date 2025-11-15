
class Api::V1::Admin::PoliticalPartiesController < ApplicationController

    before_action :authenticate_user!
    before_action :authorize_admin!
    before_action :set_political_party, only: [:show, :update, :destroy]

    def index
        @political_parties = PoliticalParty.all
        render json: @political_parties
    end

    def show
        render json: @political_party
    end

    def create
        @political_party = PoliticalParty.new(political_party_params)
        if @political_party.save
            render json: @political_party, status: :created
        else
            render json: @political_party.errors, status: :unprocessable_entity
        end
    end

    def update
        if @political_party.update(political_party_params)
            render json: @political_party
        else
            render json: @political_party.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @political_party.destroy
        render json: { message: 'Political party deleted' }, status: :ok
    end

    private

    def set_political_party
        @political_party = PoliticalParty.find(params[:id])
    end

    def political_party_params
        params.require(:political_party).permit(:name, :acronym, :description, :founded_date)
    end

    def authorize_admin!
        head :forbidden unless current_user.admin?
    end
end
      
end