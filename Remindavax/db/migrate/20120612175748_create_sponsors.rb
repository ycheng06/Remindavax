class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
			t.string :firstname
			t.string :lastname
			t.string :email
      t.string :phone
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end
end
