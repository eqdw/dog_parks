class CheckIn < ActiveRecord::Base
  delegate :name, :to => :dog
  validates :dog_id, :presence => true

  belongs_to :dog

  scope :recent, -> { where( "created_at >= ?", 1.hours.ago).order("created_at DESC") }
end
