class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.references :pet, null: false, foreign_key: true
      t.integer :treatment_type, null: false
      t.date :start_date
      t.date :end_date
      t.string :dosage
      t.string :frequency
      t.text :notes
      t.date :renew_date
      t.string :name

      t.timestamps
    end
  end
end
