class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.date :birth_day
      t.string :gender
      t.string :address

      t.timestamps
    end
  end
end
