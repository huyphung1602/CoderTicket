class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_type_id
      t.integer :total_price
      t.integer :quantity

      t.timestamps
    end
  end
end
