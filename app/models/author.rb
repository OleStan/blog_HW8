class Author < ApplicationRecord
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
