class FixDateReserved < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :appointments, :date_reserved, :appointment_date
  end
end
