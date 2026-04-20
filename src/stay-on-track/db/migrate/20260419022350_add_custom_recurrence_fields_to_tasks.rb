class AddCustomRecurrenceFieldsToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :custom_recurrence_number, :integer
    add_column :tasks, :custom_recurrence_unit, :string
  end
end
