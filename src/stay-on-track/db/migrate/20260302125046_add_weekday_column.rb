class AddWeekdayColumn < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :weekday_recurrence, :string
  end
end
