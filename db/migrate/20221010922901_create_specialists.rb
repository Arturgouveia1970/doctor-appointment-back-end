class CreateSpecialists < ActiveRecord::Migration[7.0]
    def change
      create_table :specialists do |t|
        t.string :name, null: false, index: true
        t.text :description, null: false
        t.integer :rating, comment: 'Specialists Doctor rating system', limit: 1
  
        t.timestamps
      end
    end
  end
  