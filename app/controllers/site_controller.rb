class SiteController < ApplicationController
  def index
    @activities = Activity.all.paginate :page => params[:page], :order => 'created at DESC'
  end

end
