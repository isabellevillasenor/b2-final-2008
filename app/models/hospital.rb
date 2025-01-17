class Hospital < ApplicationRecord
  validates_presence_of :name

  has_many :doctors, dependent: :destroy
end