module Users
  class Api::V1::General::Users::RegistrationController < ApiGuard::RegistrationController
    # before_action :authenticate_resource, only: [:destroy]

    def create
      # init_resource(params.permit(:email, :document_number, :password, :password_confirmation)) 
      member = Member.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        full_name: "#{params[:first_name]} #{params[:last_name]}",
        email: params[:email],  
        document_number: params[:document_number],
        document_type: params[:document_type] || "DNI",
        role_member: 0,
        gender: params[:gender] || 2
      )

      if member.save
        user=member.user
        create_token_and_set_header(user, "user") # Crea tokens JWT
        role = user.roleable
        full_name = role.respond_to?(:full_name) ? role.full_name : "#{role.try(:first_name)} #{role.try(:last_name)}"

        render json: {
          message: I18n.t('api_guard.registration.signed_up'),
          access_token: response.headers['Access-Token'],
          refresh_token: response.headers['Refresh-Token'],
          expires_at: response.headers['Expire-At'],
          user: user.attributes.symbolize_keys.merge(
            full_name: full_name,
            role_type: user.roleable_type,
            role_id: user.roleable_id
          )
        }, status: :created
      else
        render_error(422, object: member)
      end
    end

    def destroy
      current_resource.destroy
      render_success(message: I18n.t('api_guard.registration.account_deleted'))
    end

    private

    def sign_up_params
      params.permit(:email, :document_number, :password, :password_confirmation, :avatar, :registration)
    end
  end
end
