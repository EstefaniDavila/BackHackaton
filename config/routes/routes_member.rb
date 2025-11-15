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
      end
    end
  end
end
