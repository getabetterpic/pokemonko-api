class CreatePkoSets < ActiveRecord::Migration[5.1]
  def change
    create_table :pko_sets do |t|
      t.string :code, null: false
      t.string :name
      t.string :series
      t.integer :total_cards
      t.boolean :standard_legal
      t.boolean :expanded_legal
      t.date :release_date

      t.timestamps
    end
  end
end
