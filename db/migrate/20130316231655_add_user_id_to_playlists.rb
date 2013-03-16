class AddUserIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :user_id, :integer
    add_index :playlists, :user_id
  end
end
