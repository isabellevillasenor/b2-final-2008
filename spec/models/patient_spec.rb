require 'rails_helper'

describe Patient do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:age).is_greater_than(0)}
  end

  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end
end