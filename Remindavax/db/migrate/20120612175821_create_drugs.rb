class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
			t.string :name
			t.string :treatmentname
      t.integer :days_worth_of_medication
      t.date :refill_date
      t.integer :patient_id
      t.timestamps
    end
  end
end
