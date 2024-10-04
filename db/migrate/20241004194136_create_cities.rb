class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.references :state, foreign_key: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
