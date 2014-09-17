class AddMoreDetailstoUser < ActiveRecord::Migration
  def change
  	add_column :users, :hair_type, :string
  	add_column :users, :about, :text
  end
end
