class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :task
      t.timestamp :dead_line

      t.timestamps
    end
  end
end
