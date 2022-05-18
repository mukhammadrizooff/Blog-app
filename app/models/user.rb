class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'

  def most_recent_posts(items = 3)
    posts.order(created_at: :desc).take(items)
  end

  def posts_desc_order
    posts.order(created_at: :desc)
  end
end
