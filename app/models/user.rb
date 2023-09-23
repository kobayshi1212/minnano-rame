class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :notifications, dependent: :destroy
  has_one_attached :profile_image

  def total_favorites  # ユーザーが投稿したすべての投稿のいいね数を合計する
    self.posts.joins(:favorites).count
  end

  def total_post_comments
    self.posts.joins(:post_comments).count
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def follow(user_id)  # フォローしたときの処理
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)  # フォローを外すときの処理
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)  # フォローしているか判定
    followings.include?(user)
  end

  def get_profile_image(width, height) #プロフィール画像の初期画像の設定
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/2069258.jpg')
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
