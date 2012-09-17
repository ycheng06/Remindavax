class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :relation_to_sponsor
      t.integer :doctor_id
      t.integer :sponsor_id
      t.timestamps
    end
  end
end
