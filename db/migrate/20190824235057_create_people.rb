class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :document
      t.date :brith_date

      t.timestamps
    end
  end
end
