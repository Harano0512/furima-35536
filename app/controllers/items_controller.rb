class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :set_orders, only: [:index, :show, :edit, :update, :destroy]
  before_action :check_user, only: [:destroy, :edit, :update]
  before_action :check_order, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item[:id])
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :text, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_orders
    @orders = Order.all
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def check_order
    redirect_to root_path if @item.order.present?
  end
end
