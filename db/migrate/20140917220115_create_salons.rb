class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|

      t.string :address
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

