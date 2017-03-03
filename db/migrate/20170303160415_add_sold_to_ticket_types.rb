class AddSoldToTicketTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :ticket_types, :sold_quantity, :integer
  end
end
