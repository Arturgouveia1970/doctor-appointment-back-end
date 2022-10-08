class User < ApplicationRecord
  has_many :reservations
  has_many :doctors
  has_many :doctors_reservations, through: :reservations, source: :user_id

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
end
