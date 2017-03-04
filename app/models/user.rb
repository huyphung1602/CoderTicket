class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :events, foreign_key: 'owner_id'

  def to_s
    email
  end
end
