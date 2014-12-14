class DogsController < ApplicationController

  before_action :set_user
  before_action :set_dog, :only => [:show]
  before_action :authenticate_user!,  :only => [:profile, :update_profile]

  def index
    @dogs = Dog.all.sort{|a,b| a.name <=> b.name}
  end

  def show
    @check_ins = @dog.check_ins.order("created_at DESC").limit(20)
  end

  private

  def set_user
    @user = current_user
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
