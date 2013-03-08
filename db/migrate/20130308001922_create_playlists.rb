class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.integer :owner
      t.boolean :shared

      t.timestamps
    end
  end
end
