class AddOwneridToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :owner_id, :integer
  end
end
