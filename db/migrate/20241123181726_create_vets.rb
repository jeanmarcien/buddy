class CreateVets < ActiveRecord::Migration[7.1]
  def change
    create_table :vets do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
