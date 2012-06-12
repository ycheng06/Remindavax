class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
			t.string :name, :null => false
			t.string :phone
			t.string :email, :null => false
      t.timestamps
    end
  end
end
