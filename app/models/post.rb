class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', inverse_of: :post, dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', inverse_of: :post, dependent: :destroy
end
