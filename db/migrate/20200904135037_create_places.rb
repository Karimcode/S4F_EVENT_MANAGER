class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :avatar
      t.string :description
    t.belongs_to :user, index: true


      t.timestamps
    end
  end
end
