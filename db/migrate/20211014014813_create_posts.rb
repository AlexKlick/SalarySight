class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :company
      t.integer :salary
      t.string :previous_education
      t.integer :boot_camp_type
      t.string :dev_title
      t.text :comments
      t.string :state
      t.integer :job_hunt_duration
      t.integer :gender
      t.integer :age
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
