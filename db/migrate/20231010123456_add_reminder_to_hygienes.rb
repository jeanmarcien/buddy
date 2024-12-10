
class AddReminderToHygienes < ActiveRecord::Migration[6.1]
  def change
    add_column :hygienes, :reminder, :datetime
  end
end