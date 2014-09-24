class AddFieldToSalons < ActiveRecord::Migration
  def change
  	add_column :salons, :website, :float
  	add_column :salons, :phone_number, :string
  end
end
