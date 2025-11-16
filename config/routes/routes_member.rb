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
        # 1️⃣ TODOS LOS CANDIDATOS POR PARTIDO
        get '/candidates/all_by_party/:party',             to: 'candidates#all_by_party'

        # Presidentes + vice 1 + vice 2
        get '/candidates/only_presidents_by_party/:party', to: 'candidates#only_presidents_by_party'

        # Senado + diputados + parlamento andino (web)
        get '/candidates/web_by_party/:party',             to: 'candidates#web_by_party'

        # Individuales
        get '/candidates/senado_by_party/:party',          to: 'candidates#senado_by_party'
        get '/candidates/diput_by_party/:party',           to: 'candidates#diput_by_party'
        get '/candidates/parlament_by_party/:party',       to: 'candidates#parlament_by_party'

        # 2️⃣ FILTRO POR PARTIDO + CIRCUNSCRIPCIÓN
        get '/candidates/by_party_and_circ/:party/:circumscription', to: 'candidates#by_party_and_circumscription'

        # 3️⃣ CIRCUNSCRIPCIONES POR PARTIDO
        get '/candidates/circumscription_list_by_party/:party', to: 'candidates#circumscription_list_by_party'

        #  EVENTOS GENERALES
        get '/events',                                      to: 'events#index'
        get '/events/:political_party',                     to: 'events#by_political_party'
        get '/events/general',                              to: 'events#by_general'
      end
    end
  end
end
