class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
			t.string :name, :null => false
			t.string :treatmentname, :null => false
			t.date :startdate
			t.date :enddate
			t.integer :dosage
			t.integer :frequecy
      t.timestamps
    end
  end
end
