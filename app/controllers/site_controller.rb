class SiteController < ApplicationController
  def index
    @activities = Activity.all.paginate :page => params[:page], :per_page => 15
  end
end
