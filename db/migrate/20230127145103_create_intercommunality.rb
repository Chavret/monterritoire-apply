class CreateIntercommunality < ActiveRecord::Migration[7.0]
  def change
    create_table :intercommunalities do |t|
      t.string :name # null: false casse le test de shoulda-matchers car il tente de créer un record sans nom
      t.string :siren, uniqueness: true
      t.string :form

      t.timestamps
    end
  end
end
