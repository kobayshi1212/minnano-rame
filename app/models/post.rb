class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/2389161.jpg')
      image.attach(io: File.open(file_path), filename: '2389161.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


end
