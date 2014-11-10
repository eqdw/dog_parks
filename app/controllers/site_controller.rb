class SiteController < ApplicationController

  before_filter :set_recent_checkins

  def index
  end


  def check_in
    @check_in = CheckIn.new(:name => params[:name])

    if @check_in.save
      redirect_to :index
    else
      @error = true
      render :index
    end
  end

  private

  def set_recent_checkins
    @recent_checkins = CheckIn.recent
  end
end
