class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.date :date
      t.integer :salary

      t.timestamps
    end
  end
end
