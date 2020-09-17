class CreateFormulas < ActiveRecord::Migration[6.0]
  def change
    create_table :formulas do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.boolean :validation
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
