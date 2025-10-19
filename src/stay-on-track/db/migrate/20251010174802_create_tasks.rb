class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :deadline_date
      t.string :recurrence
      t.string :deadline_type
      t.string :urgency
      t.string :category
      t.boolean :completed

      t.timestamps
    end
  end
end
