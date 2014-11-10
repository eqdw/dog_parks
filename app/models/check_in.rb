class CheckIn < ActiveRecord::Base
  validates :name, :presence => true

  scope :recent, -> { where( "created_at >= ?", 1.hours.ago).order("created_at DESC") }
end
