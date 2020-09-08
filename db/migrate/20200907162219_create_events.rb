class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :duration
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :event_date

      t.timestamps
    end
  end
end
