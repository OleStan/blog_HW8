class Author < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGX= /^[\w\d]+@[\w\d]+\.[\w]+/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
