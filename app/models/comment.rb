class Comment < ApplicationRecord
  belongs_to :post
  broadcasts_to :post

  validates :content, presence: true

  def first?
    post.comments.first == self
  end
end
