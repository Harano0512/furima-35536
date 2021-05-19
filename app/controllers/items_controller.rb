class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
  end

  def show
    
  end

end
