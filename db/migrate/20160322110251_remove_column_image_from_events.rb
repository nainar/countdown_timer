class RemoveColumnImageFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :image
  end
end
