class SiteController < ApplicationController

  before_action :set_user
  before_action :set_recent_checkins, :only => [:index, :check_in]
  before_action :authenticate_user!,  :only => [:profile, :update_profile]


  def index
  end

  def check_in
    @user.dogs.each do |dog|
      CheckIn.create(:name => dog.name)
    end

    redirect_to :index
  end

  def about
  end

  def profile
    @dogs = @user.dogs
  end

  def add_dog
    @dogs = @user.dogs
    new_dog = Dog.new(:name => params[:name], :user => @user)

    if new_dog.save
      redirect_to :profile
    else
      @error = true
      render :profile
    end
  end

  def remove_dog
    dog = Dog.find(params[:id])

    dog.destroy

    redirect_to :profile
  end

  private

  def set_user
    @user = current_user
  end

  def set_recent_checkins
    @recent_checkins = CheckIn.recent
  end
end
