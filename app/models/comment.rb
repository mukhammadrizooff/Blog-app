class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :comments
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', inverse_of: :comments
end
