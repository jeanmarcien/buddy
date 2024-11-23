class CreateVetAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :vet_appointments do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: true
      t.datetime :date
      t.string :reason
      t.text :notes
      t.string :status

      t.timestamps
    end
  end
end
