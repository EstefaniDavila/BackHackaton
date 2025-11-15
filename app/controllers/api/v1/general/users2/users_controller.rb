class Api::V1::General::Users2::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def profile
    profile = find_profile(params[:roleable_type], params[:roleable_id])
    # authorize profile
    render json: {
      profile: profile
    }, status: :ok
  rescue Pundit::NotAuthorizedError
    unauthorized_response
  end

  def update_avatar
    # debugger
    user = User.find_by(document_number: params[:document_number])

    user.avatar = params[:avatar] unless params[:avatar] == 'null'
    if user.save!
      render json: {
        message: '¡Foto de perfil actualizado con éxito!'
      }, status: :ok
    else
      render json: {
        message: 'No es un formato adminito, corrija e inténtelo de nuevo'
      }, status: :unprocessable_entity
    end
  end

  private

  def find_profile(roleable_type, roleable_id)
    class_mappings = {
      'Admin' => Admin,
      'Member' => Member
    }
    class_mappings[roleable_type].find(roleable_id)
  end
end
