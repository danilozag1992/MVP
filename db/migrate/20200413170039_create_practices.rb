class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.integer :hours
      t.references :coach, index: true

      t.timestamps
    end
    add_foreign_key :practices, :users, column: :coach_id
  end
end
