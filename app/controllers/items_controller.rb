class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    if item.save
      redirect_to root_path
    else 
      render "/new"
    end
  end

  def show
    
  end

  private
  def item_params
    params.permit(:item_name, :text, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_days_id)
  end

end

