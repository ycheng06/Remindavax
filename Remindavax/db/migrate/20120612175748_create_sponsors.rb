class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
		t.string :firstname, :null => false
		t.string :lastname, :null => false
		t.string :email, :null => false
      t.timestamps
    end
  end
end
