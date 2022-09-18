class Favorite < ApplicationRecord
  #UserモデルのidやPostImageモデルのidと関連付け
  belongs_to :user
  belongs_to :post_image
  
end
