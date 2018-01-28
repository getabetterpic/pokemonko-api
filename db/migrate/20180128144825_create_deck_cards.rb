class CreateDeckCards < ActiveRecord::Migration[5.1]
  def change
    create_table :deck_cards, id: false do |t|
      t.references :deck, null: false
      t.references :card, null: false

      t.timestamps
    end
  end
end
