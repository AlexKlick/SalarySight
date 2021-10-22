class ChangeNegotiationOnPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :negotiation
    add_column :posts, :negotiation, :string
  end
end
