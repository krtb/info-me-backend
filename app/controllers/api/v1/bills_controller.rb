class Api::V1::BillsController < ApplicationController
 before_action :find_bill, only: [:show, :destroy, :update]
#  skip_before_action :authorized, only: [:index]

 def index
   @bills = Bill.all
   render json: { bills: Bill.all}
 end

 def new
   @bill = Bill.create
 end

 def show
   # @bill = Bill.find(params[:id])
   render json: { bill: @bill}
 end

 def create
   @bill = Bill.create(bill_params)
   render json: {bill: @bill}
 end

 def update
   # @bill = Bill.find(params[:id])
   @bill.update(bill_params)
   if @bill.save
     render json: @bill, status: :accepted
   else
     render json: { errors: @bill.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   # @post = post.find(params[:id])
   @bill.destroy
   render json: @bill, status: :accepted
 end

 private

 def bill_params
   params.permit(:api_bill_id, :for_bill?)
 end

 def find_bill
   @bill = Bill.find(params[:id])
 end
end
