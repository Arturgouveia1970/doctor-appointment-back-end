class ChangeReservationsToAppointments < ActiveRecord::Migration[7.0]
  def change
    rename_table :reservations, :appointments
  end
end
