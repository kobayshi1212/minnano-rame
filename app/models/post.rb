class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy 
  has_one_attached :image
  
  has_one :notification, as: :subject, dependent: :destroy
  
  validates :store, presence: true
  validates :image, presence: true
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("store LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("store LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("store LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("store LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  def convert_to_webp #画像をWebpに変換する
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/2389161.jpg')
      image.attach(io: File.open(file_path), filename: '2389161.jpg', content_type: 'image/jpeg')
    end
    image.variant(convert: 'webp')
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
