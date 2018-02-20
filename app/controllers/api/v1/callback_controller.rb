class Api::V1::CallbackController < ApplicationController
  def callback
    user = User.find_or_initialize_by(email: params[:email])
    user.access_token = params[:access_token]
    user.id_token = params[:id_token]
    user.expires_at = Time.at(params[:expires_at].to_i / 1000)
    if user.save
      render json: {}, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
