class Venue < ActiveRecord::Base
  belongs_to :region
  validates_uniqueness_of :name
  validates_presence_of :name, :full_address, :region_id
end
