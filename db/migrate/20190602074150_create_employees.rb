class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name, :length => 255
      t.references :organization
      t.timestamps
    end
  end
end
