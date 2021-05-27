class OrdersController < ApplicationController
  before_action :set_item 
  before_action :authenticate_user!
  before_action :check_user, only: [:index]
  before_action :check_order, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if order_params[:token] == "undefined"
      render :index
    elsif @order_address.valid?
      pay_item
      @order_address.save
      redirect_to item_path(@item[:id])
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    redirect_to root_path if current_user.id == @item.user_id
  end


  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,
       :order_id).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_order
    @orders = Order.all
    @orders.each do |order|
      if order.item_id == @item.id
        redirect_to root_path
        return
      end
    end
  end

end
