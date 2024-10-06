class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.references :country, foreign_key: true, null: false
      t.references :state, foreign_key: true, null: false
      t.references :city, foreign_key: true, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }
      t.date :date_of_birth, null: false
      t.string :gender
      t.string :address

      t.timestamps
    end
  end
end
