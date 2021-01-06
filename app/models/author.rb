class Author < ApplicationRecord
  has_secure_password
  has_many :ratings, dependent: :destroy

  VALID_PASS = /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}\z/
  VALID_EMAIL_REGX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, :gender, :birthday, :avatar, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGX }
  validates_uniqueness_of :email, case_sensitive: false
  validates :password,  presence: true, length: { in: 8..16  }, format: { with: VALID_PASS,
             message: "should have one capital and lowercase Latin character, one digit, and one special character." }
  def full_name
    "#{self.first_name} #{self.last_name}"
  end


end
