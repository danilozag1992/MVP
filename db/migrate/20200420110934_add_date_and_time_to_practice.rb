class AddDateAndTimeToPractice < ActiveRecord::Migration[6.0]
  def change
    add_column :practices, :start_time, :datetime
    add_column :practices, :end_time, :datetime
  end
end
