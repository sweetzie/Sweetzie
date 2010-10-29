class ScanController < ApplicationController
  
  # Handle the barcodes returned by the scanning application
  
  def index
    # let's see if we have the item in our databse based on the barcode that was returned by the scan, if the parameter is blank, then the item is equal to nothing
    item = Item.find_by_barcode(params[:barcode]) unless params[:barcode].blank?
    case
    # when the item exists, i.e. is found
    when item
      redirect_to item # go to the item
      flash[:notice] = 'Item found' # send a success message
    # the item does not exist, and is therefore able to be added to the database
    when !item
      redirect_to '/items/new/' + params[:barcode] # redirect to the new item page and pass along the barcode
      flash[:notice] = 'Looks like you\'re the first to find this one. Mind telling us about it?' #send a message alerting the user that they must add the item
    # if the user stumbles across the scan by accident...
    else 
      redirect_to '/' # send them home
    end
  end

end
