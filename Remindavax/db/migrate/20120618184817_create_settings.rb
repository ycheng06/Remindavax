class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :send_by_text
      t.boolean :send_by_email
      t.boolean :reminder_summary
      t.boolean :reminder_preferred_times
      t.boolean :is_active
      t.integer :patient_id
      t.timestamps
    end
  end
end
