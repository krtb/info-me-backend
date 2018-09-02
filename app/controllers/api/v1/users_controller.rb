class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: %i[create]
 
 def index
   @users = User.all
   render json: { users: User.all}
 end

 def new
   @user = User.create
 end

 def show
   # @user = User.find(params[:id])
   render json: { user: @user}
 end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

 def update
   # @user = User.find(params[:id])
   @user.update(user_params)
   if @user.save
     render json: @user, status: :accepted
   else
     render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   # @post = post.find(params[:id])
   @user.destroy
   render json: @user, status: :accepted
 end

 private

 def user_params
   params.require(:user).permit(:name, :email, :password, :zip_code, :political_party)
 end

 def find_user
   @user = User.find(params[:id])
 end
end
