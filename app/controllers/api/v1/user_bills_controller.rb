class Api::V1::UserBillsController < ApplicationController
 before_action :find_user_bill, only: [:show, :destroy, :update]
 def index
   @user_bills = UserBill.all
   render json: { user_bills: UserBill.all}
 end

 def new
   @user_bill = UserBill.create
 end

 def show
   # @user_bill = UserBill.find(params[:id])
   render json: { user_bill: @user_bill}
 end

 def create
   @user_bill = UserBill.create(user_bill_params)
   render json: {user_bill: @user_bill}
 end

 def update
   # @user_bill = UserBill.find(params[:id])
   @user_bill.update(user_bill_params)
   if @user_bill.save
     render json: @user_bill, status: :accepted
   else
     render json: { errors: @user_bill.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   # @post = post.find(params[:id])
   @user_bill.destroy
   render json: @user_bill, status: :accepted
 end

 private

 def user_bill_params
   params.permit(:user_id, :bill_id)
 end

 def find_user_bill
   @user_bill = UserBill.find(params[:id])
 end
end
