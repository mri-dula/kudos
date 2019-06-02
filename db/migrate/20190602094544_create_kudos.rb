class CreateKudos < ActiveRecord::Migration[5.2]
  def change
    create_table :kudos do |t|
      t.references :from, :to_table => :employees
      t.references :to, :to_table => :employees
      t.string :message, :length => 255
      t.timestamps
    end
  end
end
