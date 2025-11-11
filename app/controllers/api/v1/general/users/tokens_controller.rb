module Users
  class Api::V1::General::Users::TokensController < ApiGuard::TokensController
    before_action :authenticate_resource, only: [:create]
    before_action :find_refresh_token, only: [:create]

    def create
      create_token_and_set_header(current_resource, resource_name)
      @refresh_token.destroy
      blacklist_token if ApiGuard.blacklist_token_after_refreshing
      role = current_resource.roleable
      full_name = role.respond_to?(:full_name) ? role.full_name : "#{role.try(:first_name)} #{role.try(:last_name)}"

      render json: {
        access_token: response.headers['Access-Token'],
        refresh_token: response.headers['Refresh-Token'],
        expire_at: response.headers["Expire-At"],
        user: {
          **current_resource.attributes.symbolize_keys,
          full_name: full_name,
          role_type: current_resource.roleable_type,
          role_id: current_resource.roleable_id
        },
        rol: current_resource.roleable_id,
      }, status: :ok
    end

    private

    def find_refresh_token
      refresh_token_from_header = request.headers['Refresh-Token']
    
      if refresh_token_from_header
        @refresh_token = find_refresh_token_of(current_resource, refresh_token_from_header)
        return render_error(401, message: I18n.t('ussuario con token invalido')) unless @refresh_token
      else
        render_error(401, message: I18n.t('usuario no encontrado'))
      end
    end
  end
end
