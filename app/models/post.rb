class Post < ApplicationRecord
  extend FriendlyId

  has_rich_text :content
  has_one_attached :thumb
  has_many :comments, dependent: :destroy
  friendly_id :title, use: :slugged

  validates :title, :description, :content, presence: true
  validates :thumb, content_type: [ "image/png", "image/jpg", "image/jpeg", "image/webp" ], size: { less_than: 2.megabytes }
end
