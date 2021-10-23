class ChangeAgeOnPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :age
    add_column :posts, :age, :string
  end
end
