class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_type
  validates :quantity, presence: true, numericality: true
end
