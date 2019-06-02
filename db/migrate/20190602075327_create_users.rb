class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, :length => 255
      t.string :encrypted_password
      t.timestamps
    end

    change_table :employees do |t|
      t.references :user
    end
  end
end
