# our system users
class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
end

class Post < ActiveRecord::Base
	belongs_to :user
end


class Comments < ActiveRecord::Base 
	belongs_to :user
end

