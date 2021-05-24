class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :check_user, only: :destroy

  def index
    @items = Item.all
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
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def check_user
    item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == item.user_id
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :text, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_day_id, :image).merge(user_id: current_user.id)
  end
end
