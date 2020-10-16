class AddTokenExpiresAtToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token_expires_at, :string
  end
end
