class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :phone
      t.string :email
      t.string :relation_to_sponsor
      t.timestamps
    end
  end
end
