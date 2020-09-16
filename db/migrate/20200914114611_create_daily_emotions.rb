class CreateDailyEmotions < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_emotions do |t|
      t.references :emotion, foreign_key: true
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
