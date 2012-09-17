class CreatePreferredTimes < ActiveRecord::Migration
  def change
    create_table :preferred_times do |t|
      t.time :time_to_receive_reminder
      t.integer :setting_id
      t.timestamps
    end
  end
end
