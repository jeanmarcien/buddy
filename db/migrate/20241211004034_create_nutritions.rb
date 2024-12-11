class CreateNutritions < ActiveRecord::Migration[7.1]
  def change
    create_table :nutritions do |t|
      t.references :pet, null: false, foreign_key: true
      t.integer :times_per_day
      t.integer :quantity
      t.string :food_type
      t.string :brand
      t.decimal :price
      t.date :reminder_date

      t.timestamps
    end
  end
end
