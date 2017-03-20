class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :verses, dependent: :destroy
  has_many :notes, through: :verses

end
