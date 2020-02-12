class Api::V1::BillsController < ApplicationController
  before_action :find_bill, only: [:show, :destroy, :update]

  # GET /api/v1/bills
  def index
    @bills = Bill.paginate(page: params[:page], per_page: 100) 
    render json: {bills: @bills }
  end

  # POST /api/v1/bills
  def create
    @bill = Bill.create(bill_params)
    render json: {bill: @bill}
  end

  # GET /api/v1/bills/:id
  def show
    render json: { bill: @bill}
  end

  # PUT /api/v1/bills/:id
  def update
    @bill.update(bill_params)
    if @bill.save
      render json: @bill, status: :accepted
    else
      render json: { errors: @bill.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # DELETE /api/v1/bills/:id
  def destroy
    @bill.destroy
    render json: @bill, status: :accepted
  end

  def new
    @bill = Bill.create
  end

 private

  # WHITELIST params
  def bill_params
    params.permit(:api_bill_id, :for_bill?)
  end

  def find_bill
    @bill = Bill.find(params[:id])
  end

end
