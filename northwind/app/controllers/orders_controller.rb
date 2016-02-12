class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show, :new, :create, :edit, :destroy, :update, :find]
  before_action :set_customer, only: [:find]
  def find
    #@orders = Customer.where(ContactName: params[:search_string]).first.orders.page(params[:page])
    #@orders = (Customer.find_by ContactName: params[:search_string]).orders.page(params[:page])
    #@orders = Order.orders_users(Customer.customer_id(params[:search_string])).page(params[:page])
    @orders = @customer.orders.page(params[:page])
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.page(params[:page])
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
    orderDate = order_params["OrderDate(3i)"]+ "/" + order_params["OrderDate(2i)"] + "/" + order_params["OrderDate(1i)"]
    requiredDate = order_params["RequiredDate(3i)"]+ "/" + order_params["RequiredDate(2i)"] + "/" + order_params["RequiredDate(1i)"]
    shippedDate = order_params["ShippedDate(3i)"]+ "/" + order_params["ShippedDate(2i)"] + "/" + order_params["ShippedDate(1i)"]

    @order = Order.new({CustomerID: order_params[:CustomerID],OrderDate: orderDate,RequiredDate: requiredDate,ShippedDate: shippedDate})
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
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
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_customer
      @customer = Customer.find_by ContactName: params[:search_string]
      redirect_to orders_url unless @customer
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:CustomerID, :OrderDate, :RequiredDate, :ShippedDate)
    end
end