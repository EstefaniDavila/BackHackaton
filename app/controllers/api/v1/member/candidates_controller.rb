class Api::V1::Member::CandidatesController < ApplicationController

    def by_party_and_role
        party = params[:party]
        role = params[:role] # 'presidential', 'vice1', 'vice2', 'deputy'
        
        candidates = Candidate.where(political_party: party, role: role)
        render json: candidates
    end

    def deputies_by_party
        party = params[:party]
        candidates = Candidate.where(political_party: party, role: 'deputy')
        render json: candidates
    end

    def by_party_and_location
        party = params[:party]
        location = params[:location]
        
        candidates = Candidate.where(
            political_party: party,
            location: location
        )
        render json: candidates
    end

    def by_party_role_and_location
        party = params[:party]
        role = params[:role]
        location = params[:location]
        
        candidates = Candidate.where(
            political_party: party,
            role: role,
            location: location
        )
        render json: candidates
    end
end