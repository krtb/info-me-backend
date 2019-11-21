class Api::V1::UserBillsController < ApplicationController
 before_action :find_user_bill, only: [:show, :destroy, :update]

 # GET /api/v1/user_bills
 def index
   @user_bills = UserBill.all
   render json: { user_bills: UserBill.all}
 end

  # POST /api/v1/user_bills
  def create
   @user_bill = UserBill.create(user_bill_params)
   render json: {user_bill: @user_bill}
  end

  # GET  /api/v1/user_bills/:id
  def show
   render json: { user_bill: @user_bill}
  end

  # POST /api/v1/user_bills/:id
  def update
   @user_bill.update(user_bill_params)
   if @user_bill.save
     render json: @user_bill, status: :accepted
   else
     render json: { errors: @user_bill.errors.full_messages }, status: :unprocessible_entity
   end
 end

  # DELETE /api/v1/user_bills/:id
  def destroy
    @user_bill.destroy
    render json: @user_bill, status: :accepted
  end

  def new
    @user_bill = UserBill.create
  end

 private
 # WHITELIST params
  def user_bill_params
    params.permit(:user_id, :bill_id)
  end

  def find_user_bill
    @user_bill = UserBill.find(params[:id])
  end

end
