class CreateActivities < ActiveRecord::Migration[6.1]
  def up
    create_table :activities do |t|

      t.integer "user_id"
      t.string "name", :default => '', :null => false 
      t.integer "goal"
      t.string "units"
      t.integer "frequency"

      t.timestamps
    end
  end

  def down 
    drop_table:activities
  end

end
