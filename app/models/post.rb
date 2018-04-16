class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :post,  presence: true, length: {minimum: 11}
end