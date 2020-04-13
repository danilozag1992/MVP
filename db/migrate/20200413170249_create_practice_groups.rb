class CreatePracticeGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :practice_groups do |t|
      t.belongs_to :practice
      t.belongs_to :group
      t.timestamps
    end
  end
end
