# encoding: utf-8
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order._date = DateTime.now.to_date

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def prepare
    @order = Order.new(customer_name: cookies[:customer_name], customer_address: cookies[:customer_address], customer_mobile: cookies[:customer_mobile])
    if params[:product]
      @product = Product.find(params[:product])
    end
    if params[:product_ids]
      @product_ids = params[:product_ids]
    end
  end
  
  def place
    @order = Order.new(params.require(:order).permit(:customer_name, :customer_address, :customer_mobile, :count))
    cookies.permanent[:customer_name] = params[:order][:customer_name]
    cookies.permanent[:customer_address] = params[:order][:customer_address]
    cookies.permanent[:customer_mobile] = params[:order][:customer_mobile]
    @order.product_ids = params.require(:product_ids)
    @order._date = DateTime.now.to_date
    if @order.save
      redirect_to @order, notice: '预订成功'
    else
      render action: 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name, :customer_address, :customer_mobile, :product_id, :count, :delivery_man, :is_complete, :note)
    end
end
