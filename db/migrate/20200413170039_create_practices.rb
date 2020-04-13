class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.integer :hours
      t.belongs_to :user

      t.timestamps
    end
  end
end
