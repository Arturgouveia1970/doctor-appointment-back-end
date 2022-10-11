class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  belongs_to :users, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: true
  validates :location, presence: true
  validates :image_url, presence: true
  validates :speciality, presence: true
  validates :email, presence: true, uniqueness: true
end
