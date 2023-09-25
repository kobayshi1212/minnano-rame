# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



admin = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "管理者"
  user.password = "kkkkkk"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/48771.png"), filename:"48771.png")
  user.admin = true
end

ziro = User.find_or_create_by!(email: "z@z") do |user|
  user.name = "じろう"
  user.password = "zzzzzz"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

taro = User.find_or_create_by!(email: "t@t") do |user|
  user.name = "たろう"
  user.password = "tttttt"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

goro = User.find_or_create_by!(email: "g@g") do |user|
  user.name = "ごろう"
  user.password = "gggggg"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Image.find_or_create_by!(shop_name: "地球規模で考えろ 伏見本店") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/地球規模で考えろ.jpg"), filename:"sample-post1.jpg")
  post.impresions = "ボリューム満点でおいしい！"
  post.user = ziro
end

Image.find_or_create_by!(shop_name: "博多ラーメン ShinShin 博多デイトス店") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/博多ラーメンShinShin博多デイトス店.jpg"), filename:"sample-post1.jpg")
  post.impresions = "博多ラーメンで一番好き！"
  post.user = taro
end

Image.find_or_create_by!(shop_name: "鶏そば啜る 丸の内本店") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/鶏そば啜る丸の内本店.jpg"), filename:"sample-post1.jpg")
  post.impresions = "名古屋ラーメンうまかった！"
  post.user = goro
end