class AddIndexesForEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :events, :name
    add_index :events, :start_date
  end
end
