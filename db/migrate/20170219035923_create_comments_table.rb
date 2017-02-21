class CreateCommentsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :comments do |t|
  		t.string :usr_comment
  		t.timestamps
  	end 
  end
end
