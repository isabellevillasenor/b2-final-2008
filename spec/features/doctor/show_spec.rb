require 'rails_helper'

describe 'Doctors Show Page' do
  before :each do 
    @h1 = Hospital.create!(name: 'Weeine Hut General')
    @d1 = @h1.doctors.create!(name: 'Doc', specialty: 'Being a Dr', university: 'Doctor School')

    @p1 = Patient.create!(name: 'Wiggle Wobble', age: 25)
    @p2 = Patient.create!(name: 'Jiggle Jobble', age: 35)

    DoctorPatient.create!(doctor_id: @d1.id, patient_id: @p1.id)
    DoctorPatient.create!(doctor_id: @d1.id, patient_id: @p2.id)
    visit doctor_path(@d1)
  end

  it 'should display the doctors name, specialty and university' do
    expect(page).to have_content(@d1.name)
    expect(page).to have_content(@d1.specialty)
    expect(page).to have_content(@d1.university)
  end

  it 'should display the hospital name they work for' do
    expect(page).to have_content(@d1.associated_hospital)
  end
  
  it 'should display a count of all patients this doctor has' do
    expect(page).to have_content(@d1.patient_count)
  end

end