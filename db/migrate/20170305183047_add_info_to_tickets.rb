class AddInfoToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :phone, :string
    add_column :tickets, :address, :text
  end
end
