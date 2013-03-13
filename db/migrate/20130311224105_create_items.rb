class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.references :song
      t.references :playlist
      t.string :title
      t.integer :order

      t.timestamps
    end
    add_index :items, :playlist_id
  end
end
