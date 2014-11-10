class SiteController < ApplicationController

  def index
    @recent_checkins = CheckIn.recent
  end


  def check_in
    @check_in = CheckIn.new(:name => params[:name])

    if @check_in.save

    else

    end
  end
end
