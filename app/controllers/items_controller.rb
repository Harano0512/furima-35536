class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :destroy, :check_user]
  before_action :check_user, only: :destroy

  def index
    @items = Item.order(created_at: "DESC")
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

  def check_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :text, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
