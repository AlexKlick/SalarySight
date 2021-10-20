class ChangePreviousEducationPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :previous_education, :degree
    add_column :posts, :username, :string
    rename_column :posts, :year_graduated, :grad_year
    add_column :posts, :program, :integer
    add_column :posts, :first_position, :string
    rename_column :posts, :dev_title, :position_title
    add_column :posts, :position_company, :string
    remove_column :posts, :type_of_employment
    remove_column :posts, :location_of_employment
    add_column :posts, :type_of_employment, :integer
    add_column :posts, :location_of_employment, :integer
  end
end
