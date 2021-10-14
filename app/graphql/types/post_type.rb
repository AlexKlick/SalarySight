module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :company, String, null: false
    field :salary, Integer, null: false
    field :previous_education, String, null: false
    field :boot_camp_type, Integer, null: false
    field :dev_title, String, null: false
    field :comments, String, null: false
    field :state, String, null: false
    field :job_hunt_duration, Integer, null: false
    field :gender, Integer, null: false
    field :age, Integer, null: false
    field :years_of_experience, Integer, null: false
  end
end
