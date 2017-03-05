class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_type
  validates :name, :phone, :address, presence: true
  validates :quantity, presence: true, :numericality => { greater_than: 0 }
end
