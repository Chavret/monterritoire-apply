class CreateStreetCommune < ActiveRecord::Migration[7.0]
  def change
    create_table :street_communes do |t|
      t.references :commune, null: false, foreign_key: true
      t.references :street, null: false, foreign_key: true

      t.timestamps
    end
  end
end
