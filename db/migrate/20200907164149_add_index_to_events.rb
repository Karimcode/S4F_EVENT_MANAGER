class AddIndexToEvents < ActiveRecord::Migration[6.0]
  def change
  add_reference :events, :place, foreign_key: true
  end
end
