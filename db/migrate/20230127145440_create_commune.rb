class CreateCommune < ActiveRecord::Migration[7.0]
  def change
    create_table :communes do |t|
      t.references :intercommunality, null: true, foreign_key: true
      t.string :name, null: false
      t.string :code_insee, null: false

      t.timestamps
    end
  end
end
