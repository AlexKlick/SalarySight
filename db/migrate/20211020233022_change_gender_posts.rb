class ChangeGenderPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :gender
    add_column :posts, :gender, :string
  end
end
