class SiteController < ApplicationController
  def index
    @activities = Activity.all.paginate :page => params[:page], :per_page => 20, :order => 'created at DESC'
  end
end
