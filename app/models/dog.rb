class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :check_ins, :dependent => :destroy

  validates :name, :presence => true
end
