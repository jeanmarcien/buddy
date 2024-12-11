class ChangeHygieneTypeToInteger < ActiveRecord::Migration[7.1]
  def change
    Hygiene.destroy_all
    remove_column :hygienes, :hygiene_type, :string
    add_column :hygienes, :hygiene_type, :integer, null: false
  end
end
