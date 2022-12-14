class Appointment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :doctor, class_name: 'Doctor', foreign_key: 'doctor_id'

  validates :appointment_date, presence: true
  validates :city, presence: true
end
