class PostImage < ApplicationRecord
  #⇓テーブルに画像を持たせられるようにする
  has_one_attached :image
  
  #PostImage モデルに User モデルを関連付ける
  belongs_to :user
  
  #PostCommentモデルとの1:Nの関係実装
  has_many :post_comments, dependent: :destroy
  
  
  
  #no_image.jpgという画像をデフォルト画像としてActiveStorageに格納し、
  #格納した画像を表示する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
