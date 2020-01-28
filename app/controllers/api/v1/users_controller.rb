class Api::V1::UsersController < ApplicationController
   before_action :set_user, only: [:edit, :update]
   skip_before_action :authorized, only: %i[create]
 
 # GET /api/v1/users
  def index
    @users = User.all
    render json: { users: User.all}
  end

  # POST /api/v1/users
  def create
    @user = User.create(user_params)

    if @user.valid?
      # TODO: changed to encode password in (auth_controller), then here if doesn't work
      @token = encode_token({ user_: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end

  end

  # GET api/v1/users/:id
  def show
    render json: { user: @user}
  end

  def edit
  end

  # PUT /api/v1/users/:id
  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user.destroy
    render json: @user, status: :accepted
  end

  def new
    @user = User.create
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

 private
 # WHITELIST these params
  def user_params
    params.require(:user).permit(:name, :email, :password, :zip_code, :political_party)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
