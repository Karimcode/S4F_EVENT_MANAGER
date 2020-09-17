class ChangeTypeNameInFormulas < ActiveRecord::Migration[6.0]
  def change
    change_table :formulas do |t|
      t.rename :type, :offer
    end
  end
end
