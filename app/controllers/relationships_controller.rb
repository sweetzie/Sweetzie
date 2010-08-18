class RelationshipsController < ApplicationController
  def create
    @relationship = current_user.relationships.build(:relation_id => params[:relation_id])
    if @relationship.save
      flash[:notice] = "Started Following"
      redirect_to users_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @friendship = current_user.relationships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed relationship."
    redirect_to users_url
  end
end
