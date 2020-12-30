class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, :image, :content, :name, presence: true
end
