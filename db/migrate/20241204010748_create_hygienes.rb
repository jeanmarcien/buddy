class CreateHygienes < ActiveRecord::Migration[7.1]
  def change
    create_table :hygienes do |t|
      t.string :hygiene_type
      t.date :date
      t.integer :frequency
      t.text :note
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
