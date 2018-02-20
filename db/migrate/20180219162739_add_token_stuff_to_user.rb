class AddTokenStuffToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_token, :string
    add_column :users, :id_token, :string
    add_column :users, :expires_at, :datetime

    add_index :users, [:email, :access_token], unique: true
  end
end
