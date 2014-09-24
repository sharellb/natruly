class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :link
      	t.string :name
      	t.text :description

      t.timestamps
    end
  end
end
