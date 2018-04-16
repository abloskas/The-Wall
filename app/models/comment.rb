class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :comment,  presence: true, length: {minimum: 11}
  validates :user, :post, presence: true
end
