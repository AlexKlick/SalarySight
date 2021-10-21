class ChangeFirstPositionPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :first_position
    add_column :posts, :first_position, :integer
  end
end
