class AddVideoToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :video_id, :integer
  end
end
