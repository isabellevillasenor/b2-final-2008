class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :university

  belongs_to :hospital
  has_many :doctor_patients, dependent: :destroy
  has_many :patients, through: :doctor_patients
end