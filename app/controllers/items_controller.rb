class ItemsController < ApplicationController
  
  # Handles items
  
  before_filter :login_required, :only => [:new] #only require users to be logged in to create a new item
  
  def index
    @items = Item.all # show all items
  end
  
  def show
    @item = Item.find_by_id(params[:id]) #find the particular item
    @review = Review.new
    session[:return_to] ||= request.referer
  end
  
  def new
    @item = Item.new #create a new instance of an item
    @barcode = params[:barcode]
  end

  def create
     @item = Item.new(params[:item])
      if @item.save
        Activity.add(current_user, Activity::NEW_ITEM, @item) # record the activity for the feed
        redirect_to @item
      else
        render 'new'
        flash[:notice] = 'Something went wrong'
      end
  end

end
