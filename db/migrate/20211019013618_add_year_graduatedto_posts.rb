class AddYearGraduatedtoPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :year_graduated, :string
    add_column :posts, :type_of_employment, :string
    add_column :posts, :location_of_employment, :string
    add_column :posts, :negotiation, :integer
    remove_column :posts, :boot_camp_type
    remove_column :posts, :comments
  end
end
