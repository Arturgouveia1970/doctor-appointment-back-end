class AddDoctorToSpeciality < ActiveRecord::Migration[7.0]
  def change
    add_reference :specialities, :doctor, null: false, foreign_key: true
  end
end
