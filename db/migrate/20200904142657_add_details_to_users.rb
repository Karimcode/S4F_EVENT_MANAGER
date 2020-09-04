class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string
    add_column :users, :phone, :string
    add_column :users, :sex, :string
    add_column :users, :job, :string
    add_column :users, :company, :string
    add_column :users, :description, :text
    add_column :users, :inscription_date, :datetime
  end
end
