class AddPatientIdToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :patient_id, :integer
    add_index :settings, :patient_id
  end
end
