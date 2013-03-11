class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :song_id
      t.references :playlist
      t.integer :order

      t.timestamps
    end
    add_index :items, :playlist_id
  end
end
