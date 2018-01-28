class AddIndexToPkoSetCode < ActiveRecord::Migration[5.1]
  def change
    add_index :pko_sets, [:code], unique: true
  end
end
