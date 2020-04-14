class CreatePracticeGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :practice_groups do |t|
      t.references :practice, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
