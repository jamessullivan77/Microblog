class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname
  		t.string :username
  		t.string :password
  		t.string :email
  		t.string :address
  		t.string :phone
  		t.binary :picture
  		t.boolean :admin, default: false
  	end
  end
end

