class Comment < ApplicationRecord
  belongs_to :post
  validates  :body,:user_id, presence: true
  enum status: { unpublished: 0, published: 1 }
  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }



  def show_comment
    if @chek == 0
      @test = "ada"
    elsif @chek == 1
      @test = "qqq"
    end

  end


end
