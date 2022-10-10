class Speciality < ApplicationRecord
    validates :name, :description, presence: true
    validates :rating, length: { maximum: 1 }, numericality: { less_than_or_equal_to: 5 }, allow_nil: true
  
    has_many :doctors, dependent: :destroy
end
  