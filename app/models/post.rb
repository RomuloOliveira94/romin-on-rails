class Post < ApplicationRecord
  has_rich_text :content
  has_one_attached :thumb

  validates :title, :description, :content, presence: true
  validates :thumb, content_type: [ "image/png", "image/jpg", "image/jpeg", "image/webp" ], size: { less_than: 2.megabytes }
end
