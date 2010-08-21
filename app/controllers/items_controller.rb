class ItemsController < ApplicationController
  
  before_filter :login_required, :only => [:new]
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find_by_id(params[:id])
  end
  
  def new
    @item = Item.new
  end

  def create
  end

end
