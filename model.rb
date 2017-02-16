# our system users
class User < ActiveRecord::Base
 has_many :proposals, foreign_key: "creator_id" # class_name: "Proposal"
 has_many :votes, class_name: "UserVote", foreign_key: "user_id"
end