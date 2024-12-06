class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :training_type
      t.integer :rating
      t.text :notes
      t.string :video_url
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
