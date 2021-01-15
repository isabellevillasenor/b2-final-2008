require 'rails_helper'

describe Doctor do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :university }
  end

  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients)}
  end

  describe 'instance methods' do
    before :each do 
      @h1 = Hospital.create!(name: 'Weeine Hut General')
      @d1 = @h1.doctors.create!(name: 'Doc', specialty: 'Being a Dr', university: 'Doctor School')
  
      @p1 = Patient.create!(name: 'Wiggle Wobble', age: 25)
      @p2 = Patient.create!(name: 'Jiggle Jobble', age: 35)
  
      DoctorPatient.create!(doctor_id: @d1.id, patient_id: @p1.id)
      DoctorPatient.create!(doctor_id: @d1.id, patient_id: @p2.id)
    end

    describe 'associated_hospital' do 
      it 'should return the hospital a doctor works at' do
        expect(@d1.associated_hospital).to eq('Weeine Hut General')
      end
    end

    describe 'patient_count' do
      it 'should return the count of patients a doctor has' do
        expect(@d1.patient_count).to eq(2)
      end
    end
  end
end