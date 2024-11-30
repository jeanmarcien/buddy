class CreateMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :measurements do |t|
      t.integer :measurement_type, null: false
      t.float :value
      t.date :date
      t.references :pet, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
