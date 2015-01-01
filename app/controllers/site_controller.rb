class SiteController < ApplicationController

  before_action :set_user
  before_action :set_dogs,            :only => [ :index, :profile          ]
  before_action :set_recent_checkins, :only => [ :index, :check_in         ]
  before_action :authenticate_user!,  :only => [ :profile, :update_profile ]


  def index
  end

  def check_in
    dog_ids = params[:dog_ids].map(&:to_i)
    dogs = only_owners_dogs(@user, dog_ids)
    dogs.each do |dog_id|
      CheckIn.create(:dog_id => dog_id)
    end

    redirect_to :index
  end

  def about
  end

  def profile
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

  def qr_codes
  end

  private

  def only_owners_dogs(user, dog_ids)
    all_dog_ids = user.dogs.map(&:id)

    dog_ids.select{|id| all_dog_ids.include?(id.to_i)}
  end

  def set_dogs
    @dogs = current_user.try(:dogs) || []
  end

  def set_user
    @user = current_user
  end

  def set_recent_checkins
    @recent_checkins = CheckIn.recent
  end
end
