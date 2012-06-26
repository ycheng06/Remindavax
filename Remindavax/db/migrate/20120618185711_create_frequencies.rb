class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.integer :times_per_day
      t.integer :days_per_week
      t.integer :weeks_per_month

      t.timestamps
    end
  end
end
