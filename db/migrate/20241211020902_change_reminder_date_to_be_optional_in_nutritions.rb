class ChangeReminderDateToBeOptionalInNutritions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :nutritions, :reminder_date, true
  end
end
