class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: %i[create]

  # issue token
  def create

    @user = User.find_by(name: user_login_params[:name]) # FIND BY: NAME

    if @user && @user.authenticate(user_login_params[:password])

      token = encode_token({ user_id: @user.id }) # USING HELPER METHOD FROM APPLICATION_CONTROLLER.RB

      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else

      render json: { message: 'Invalid username or password' }, status: :unauthorized
      
    end
  end

  private

  def user_login_params
    params.permit(:name, :password, :user, :auth)
  end
end
