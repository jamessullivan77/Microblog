# our system users
class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
end

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
end


class Comment < ActiveRecord::Base 
	belongs_to :user
	belongs_to :post
end

