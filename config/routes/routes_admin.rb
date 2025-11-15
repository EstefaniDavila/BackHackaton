Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :admin do
        ########################################
        ## POLITICAL PARTIES (CREADAS MANUAL)
        ########################################

        get    '/political_parties',                  to: 'political_parties#index'
        get    '/political_parties/:id',              to: 'political_parties#show'

        post   '/political_parties',                  to: 'political_parties#create'

        put    '/political_parties/:id/update',       to: 'political_parties#update'

        # patch  '/political_parties/:id/update',       to: 'political_parties#update'

        delete '/political_parties/:id',              to: 'political_parties#destroy'

        ## Acciones adicionales
        patch  '/political_parties/:id/approve',      to: 'political_parties#approve'
        patch  '/political_parties/:id/reject',       to: 'political_parties#reject'
        patch '/political_parties/:id/assign_representative', to: 'political_parties#assign_representative'

        ###################################### Post ######################################
        get    '/posts',                  to: 'posts#index'
        get    '/posts/:id',              to: 'posts#index_by_forum'
        get    '/posts/:id/show',         to: 'posts#show'
        post   '/posts',                  to: 'posts#create'
        put    '/posts/:id/update',       to: 'posts#update'
        delete '/posts/:id',              to: 'posts#destroy'
        #################################3mmbeer#############################3
        get '/select_member',             to: 'members#index_select'
      end
    end
  end
end
