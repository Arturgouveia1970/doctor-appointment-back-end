class CreateDoctors < ActiveRecord::Migration[7.0]
    def change
      create_table :doctors do |t|
        t.string :name
        t.decimal :price
        t.text :description
        t.string :country
        t.string :city
        t.text :address
        t.string :image_url
        t.references :category_id, index: true, foreign_key: { to_table: :categories }
  
        t.timestamps
      end
    end
  end
  