class User < ApplicationRecord
  has_many :appointments
  has_many :doctors
  has_many :doctors_appointments, through: :appointments, source: :user_id

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
end
