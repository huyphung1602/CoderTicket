class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets
  validates_presence_of :name, :price, :max_quantity
  validates_uniqueness_of :name, uniqueness: {scope: [:event_id]}
end
