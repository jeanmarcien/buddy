class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :specie
      t.string :breed
      t.date :birth_day
      t.string :gender
      t.references :user, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
