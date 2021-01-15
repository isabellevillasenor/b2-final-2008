class AddDoctorsToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_reference :hospitals, :doctor, foreign_key: true
  end
end
