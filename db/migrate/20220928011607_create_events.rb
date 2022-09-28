class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :image
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
