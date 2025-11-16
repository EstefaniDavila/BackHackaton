Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :member do
        ########################################
        ## POLITICAL PARTIES (MEMBER  VIEW)
        ########################################

        get     '/political_parties',                  to: 'political_parties#index'
        get     '/politicalparties/member',            to: 'politicalparty_members#show'
        post    '/politicalparties/member',            to: 'politicalparty_members#create'
        delete  '/politicalparties/member',            to: 'politicalparty_members#destroy'

        ########################################
        ## Candidate (MEMBER  VIEW)
        ########################################
        get     '/candidates/partyRole/:party/:role',                     to: 'candidates#by_party_and_role'
        get     '/candidates/deputiesParty/:party',                       to: 'candidates#deputies_by_party'
        get     '/candidates/partyLocation/:party/:location',             to: 'candidates#by_party_and_location'
        get     '/candidates/partyRoleLocation/:party/:role/:location',   to: 'candidates#by_party_role_and_location'
      end
    end
  end
end
