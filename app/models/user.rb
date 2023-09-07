class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by(email: 'guest@gmail.com') do |user| #存在すれば取り出す。存在しない場合は新規作成する
      user.password = SecureRandom.urlsafe_base64         #パスワードをランダムに
      user.name = "ゲスト"
    end
  end
end
