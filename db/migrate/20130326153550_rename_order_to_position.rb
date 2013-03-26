class RenameOrderToPosition < ActiveRecord::Migration
  def up
    rename_column :items, :order, :position
  end

  def down
  end
end
