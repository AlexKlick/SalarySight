class ChangeLocationOfEmploymentPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :location_of_employment
    add_column :posts, :location_of_employment, :integer
  end
end
