class Speciality < ApplicationRecord
  validates :name, :description, presence: true

  has_many :doctors, dependent: :destroy
end
