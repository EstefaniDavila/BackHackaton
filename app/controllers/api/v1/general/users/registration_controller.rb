module Users
  class Api::V1::General::Users::RegistrationController < ApiGuard::RegistrationController
    # before_action :authenticate_resource, only: [:destroy]

    def create
      init_resource(sign_up_params) 

      if resource.save
        create_token_and_set_header(resource, resource_name) # Crea tokens JWT
        role = resource.roleable
        full_name = role.respond_to?(:full_name) ? role.full_name : "#{role.try(:first_name)} #{role.try(:last_name)}"

        render json: {
          message: I18n.t('api_guard.registration.signed_up'),
          access_token: response.headers['Access-Token'],
          refresh_token: response.headers['Refresh-Token'],
          expires_at: response.headers['Expire-At'],
          user: resource.attributes.symbolize_keys.merge(
            full_name: full_name,
            role_type: resource.roleable_type,
            role_id: resource.roleable_id
          )
        }, status: :created
      else
        render_error(422, object: resource)
      end
    end

    def destroy
      current_resource.destroy
      render_success(message: I18n.t('api_guard.registration.account_deleted'))
    end

    private

    def sign_up_params
      params.permit(:email, :document_number, :password, :password_confirmation, :avatar)
    end
  end
end
