class KeysController < ApplicationController
  
  before_filter :login_required #user must be logged in
  
  # Create or regenerate the API key
  
  def create
    current_user.enable_api!
    respond_to do |format|
      format.html { redirect_to edit_user_path(current_user) }
    end
  end
  
  # Delete the API key
  
  def destroy 
    current_user.disable_api!
    
    respond_to do |format|
      format.html { redirect_to edit_user_path(current_user) }
    end
  end
  
end
