class Api::V1::PickedBillsController < ApplicationController
    before_action :set_user, only: [:create, :index]
    before_action :set_picked_bill, only: [:edit, :update]


 # GET /api/v1/picked_bills
 def index
  @picked_bills = current_user.picked_bills
   render json: { picked_bills: @picked_bills}
 end

  # POST /api/v1/picked_bills
  def create
    # using (current_user) method from application_controller.rb
    @picked_bill = current_user.picked_bills.create!(picked_bill_params)
    render json: {picked_bill: @picked_bill}
  end

  # GET  /api/v1/picked_bills/:id
  def show
   render json: { picked_bill: @picked_bill}
  end

  # POST /api/v1/picked_bills/:id
  def update
   @picked_bill.update(set_picked_bill)

   if @picked_bill.save
     render json: @picked_bill, status: :accepted
   else
     render json: { errors: @picked_bill.errors.full_messages }, status: :unprocessible_entity
   end
 end

  # DELETE /api/v1/picked_bills/:id
  def destroy
    @picked_bill = PickedBill.find(params[:id])
    @picked_bill.destroy
    render json: @picked_bill, status: :accepted
  end

  def new
    @picked_bill = PickedBill.create
  end

 private
 # WHITELIST params
  def picked_bill_params
    params.require(:picked_bill).permit!
  end

  # SET POST AND SET USER
  def set_user
    @user = current_user
    # User.find(params[:picked_bill][:user_id])
  end

  def set_picked_bill
    # binding.pry
    @picked_bill = PickedBill.find(params[:picked_bill][:id])
  end
end