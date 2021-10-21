class ChangeColumnDateSalaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :salaries, :date
    add_column :salaries, :date, :string
  end
end
