class AddCreatedAtToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :created_at, :datetime, default: -> { 'NOW()' }, null: false
  end
end
