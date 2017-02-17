
class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :posts do |t|
    t.string :topic
    t.string :rob
    t.string :james
    
  	end
	end
end
