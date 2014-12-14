class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :check_ins

  validates :name, :presence => true
end
