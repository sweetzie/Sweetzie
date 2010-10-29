class ItemsController < ApplicationController
  
  # Handles items
  
  before_filter :login_required, :only => [:new] #only require users to be logged in to create a new item
  
  def index
    @items = Item.all # show all items
  end
  
  def show
    @item = Item.find_by_id(params[:id]) #find the particular item
  end
  
  def new
    @item = Item.new #create a new instance of an item
    @barcode = params[:barcode]
  end

  def create
     @item = Item.new(params[:item])
      if @item.save
        redirect_to @item
      else
        render 'new'
        flash[:notice] = 'Something went wrong'
      end
  end

end
