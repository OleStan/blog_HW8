class Comment < ApplicationRecord
  has_ancestry
  has_many :ratings, dependent: :destroy
  belongs_to :post
  validates  :body, presence: true
  enum status: %i[unpublished published]
  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }

  def count_likes
    self.ratings.liked.count
  end
  def count_dislikes
    self.ratings.disliked.count
  end
  def count_result
    self.ratings.liked.count - self.ratings.disliked.count
  end

end
