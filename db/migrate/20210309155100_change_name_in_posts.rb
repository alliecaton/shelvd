class ChangeNameInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :readingroom_id, :reading_room_id
  end
end
