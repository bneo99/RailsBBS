class ChangeUserToUseridForPosts < ActiveRecord::Migration[6.0]
  def change
      remove_column :posts, :user
      add_column :posts, :user_id, :integer
  end
end
