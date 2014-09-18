class AddFieldstoSalons < ActiveRecord::Migration
  def change
  	add_column :salons, :latitude, :float
  	add_column :salons, :longitude, :float
  	add_column :salons, :gmaps, :boolean
  end
end
