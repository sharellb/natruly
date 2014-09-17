class AddMoreDetailstoUser < ActiveRecord::Migration
  def change
  	add_column :users, :hair_type, :string
  	add_column :users, :about, :text
  	add_column :users, :first_name, :text
  	add_column :users, :last_name, :text
  	add_column :users, :profile_name, :text
  end
end
