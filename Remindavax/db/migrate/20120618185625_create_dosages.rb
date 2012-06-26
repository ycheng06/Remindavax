class CreateDosages < ActiveRecord::Migration
  def change
    create_table :dosages do |t|
      t.string :unit
      t.decimal :amount

      t.timestamps
    end
  end
end
