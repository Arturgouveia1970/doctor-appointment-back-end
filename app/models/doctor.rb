class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :image_url, presence: true
end
