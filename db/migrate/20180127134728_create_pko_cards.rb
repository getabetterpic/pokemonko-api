class CreatePkoCards < ActiveRecord::Migration[5.1]
  def change
    create_table :pko_cards do |t|
      t.string :card_id, null: false
      t.string :name, null: false
      t.integer :national_pokedex_number
      t.string :image_url
      t.string :image_url_hi_res
      t.string :subtype
      t.string :supertype
      t.jsonb :ability
      t.jsonb :ancient_trait
      t.string :hp
      t.string :number
      t.string :artist
      t.string :rarity
      t.string :series
      t.string :set_code
      t.jsonb :retreat_cost
      t.jsonb :text
      t.jsonb :types
      t.jsonb :attacks
      t.jsonb :weaknesses
      t.jsonb :resistances
      t.string :evolves_from

      t.timestamps
    end

    add_index :pko_cards, [:card_id], unique: true
    add_index :pko_cards, [:set_code]
  end
end
