class CreateVisions < ActiveRecord::Migration[5.2]
  def change
    create_table :visions do |t|
      t.integer :user_id
      t.text :vision
      t.timestamp :dead_line

      t.timestamps
    end
  end
end
