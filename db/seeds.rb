# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



admin = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "管理者"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/48771.png"), filename:"48771.png")
  user.admin = true
end

ziro = User.find_or_create_by!(email: "z@z") do |user|
  user.name = "じろう"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ビール.jpg"), filename:"ビール.jpg")
end

taro = User.find_or_create_by!(email: "t@t") do |user|
  user.name = "たろう"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/亀.jpg"), filename:"亀.jpg")
end

goro = User.find_or_create_by!(email: "g@g") do |user|
  user.name = "ごろう"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/名古屋城.jpg"), filename:"名古屋城.jpg")
end

Post.find_or_create_by!(store: "地球規模で考えろ 伏見本店") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/地球規模で考えろ.jpg"), filename:"地球規模で考えろ.jpg")
  post.menu = "大豚ラーメン"
  post.impressions = "ボリューム満点でおいしい！"
  post.address = "京都府京都市伏見区"
  post.user = ziro
end

Post.find_or_create_by!(store: "博多ラーメン ShinShin 博多デイトス店") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/博多ラーメンShinShin博多デイトス店.jpg"), filename:"博多ラーメンShinShin博多デイトス店.jpg")
  post.menu = "とんこつラーメン"
  post.address = "福岡県博多市博多区"
  post.impressions = "博多ラーメンで一番好き！"
  post.user = taro
end

Post.find_or_create_by!(store: "鶏そば啜る 丸の内本店") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/鶏そば啜る丸の内本店.jpg"), filename:"鶏そば啜る丸の内本店.jpg")
  post.menu = "鶏そば"
  post.address = "愛知県名古屋市中区"
  post.impressions = "名古屋ラーメンうまかった！"
  post.user = goro
end