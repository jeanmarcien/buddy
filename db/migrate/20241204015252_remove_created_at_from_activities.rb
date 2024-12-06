class RemoveCreatedAtFromActivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :created_at, :datetime
  end
end
