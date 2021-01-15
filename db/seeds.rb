Hospital.destroy_all
Doctor.destroy_all
Patient.destroy_all
DoctorPatient.destroy_all

@h1 = Hospital.create!(name: 'Weeine Hut General')
@d1 = @h1.doctors.create!(name: 'Doc', specialty: 'Being a Dr', university: 'Doctor School')

@p1 = Patient.create!(name: 'Wiggle Wobble', age: 25)
@p2 = Patient.create!(name: 'Jiggle Jobble', age: 35)

DoctorPatient.create!(doctor_id: @d1.id, patient_id: @p1.id)
DoctorPatient.create!(doctor_id: @d1.id, patient_id: @p2.id)