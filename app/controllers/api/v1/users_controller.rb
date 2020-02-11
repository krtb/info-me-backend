class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  before_action :set_user, only: [:edit, :update, :show, :destroy]

 # GET /api/v1/users
  def index
    @users = User.all
    render json: @users
    # { users: User.all}
  end

  # POST /api/v1/users => REGISTER USER WITH TOKENS
  def create 

    @user = User.create(user_params)

    if @user.save #user.valid?
      response = {message: 'User registration accepted!'}
      render json: @user, status: :accepted
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end

  end

  # GET api/v1/users/:id
  def show
    render json: @user
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
    if logged_in
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    else
        render json: {message: 'User not found'}, status: :not_found
    end
  end

 private

 def user_params
    params.require(:user).permit(:name, :email, :password, :zip_code, :political_party)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
