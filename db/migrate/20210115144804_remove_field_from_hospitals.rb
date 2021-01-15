class RemoveFieldFromHospitals < ActiveRecord::Migration[5.2]
  def change
    remove_column :hospitals, :doctor_id, :integer
  end
end
