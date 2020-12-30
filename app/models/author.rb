class Author < ApplicationRecord
  has_secure_password



  VALID_EMAIL_REGX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, :gender, :birthday, :avatar, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGX }

  validates_uniqueness_of :email, case_sensitive: false
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
