class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :chain, :name, :address, :city, :zip, :phone, :country_code
      t.float :latitude, :longitude
      
      t.timestamps null: false
    end
  end
end
