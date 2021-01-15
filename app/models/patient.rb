class Patient < ApplicationRecord
  validates_presence_of :name
  validates :age, numericality: { greater_than: 0}

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
end