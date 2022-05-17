class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :likes
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', inverse_of: :likes
end
