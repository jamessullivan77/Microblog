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


class CreateTopicTable < ActiveRecord::Migration[5.0]
  def change
    create_table :topic do |t|
      t.string :topic
    end
  end
end

class CreateAuthorsTable < ActiveRecord::Migration[5.0]
  def change 
    create_table :authors do |t| 
      t.string :authorR
      t.string :authorJ
    end
  end
end

