class User < ActiveRecord::Base
    has_many :posts
    has_many :comments
    validates :username, presence: true, length: {minimum: 6}, uniqueness: true
end
