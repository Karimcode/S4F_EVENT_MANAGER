class AddTrainingNumberToUsers < ActiveRecord::Migration[6.0]
  def change
  add_column :users, :training_number, :integer
  end
end
