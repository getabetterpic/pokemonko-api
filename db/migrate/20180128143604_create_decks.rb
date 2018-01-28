class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.references :user, null: false
      t.boolean :valid_deck
      t.boolean :standard_legal
      t.boolean :expanded_legal

      t.timestamps
    end
  end
end
