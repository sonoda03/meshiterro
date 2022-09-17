class PostComment < ApplicationRecord
  
  #UserモデルもPostImageモデルも関連付けられるのは1つ
  belongs_to :user
  belongs_to :post_image
  
end
