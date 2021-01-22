class CreateDailyLogs < ActiveRecord::Migration[6.1]
  def up
    create_table :daily_logs do |t|
      
      t.integer "user_id"
      t.integer "activity_id"
      t.date "date", :default => Time.now
      t.integer "achieved", :default => 0, :null => false
      t.text "comments"

      t.timestamps
    end
  end

  def down 
    drop_table:daily_logs
  end
end
