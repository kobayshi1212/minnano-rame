class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/761729.jpg')
      profile_image.attach(io: File.open(file_path), filename: '761729.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  GUEST_USER_EMAIL = 'guest@gmail.com'
  def self.guest
    find_or_create_by(email: GUEST_USER_EMAIL) do |user| #存在すれば取り出す。存在しない場合は新規作成する
      user.password = SecureRandom.urlsafe_base64         #パスワードをランダムに
      user.name = "ゲスト"
    end
  end
  
  def guest_user?   #emailがゲストユーザーと同じであればtrueを
    email == GUEST_USER_EMAIL
  end
  
end
