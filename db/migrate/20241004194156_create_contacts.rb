class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.references :city, foreign_key: true, null: false
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :birthday
      t.string :gender
      t.string :address

      t.timestamps
    end
  end
end
