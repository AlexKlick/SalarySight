module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :company, String, null: false
    field :salary, Integer, null: false
    field :degree, String, null: false
    field :position_title, String, null: false
    field :state, String, null: false
    field :job_hunt_duration, Integer, null: false
    field :gender, String, null: false
    field :age, Integer, null: false
    field :years_of_experience, Integer, null: false
    field :grad_year, Integer, null: false
    field :username, String, null: false
    field :program, String, null: false
    field :first_position, String, null: false
    field :type_of_employment, String, null: false
    field :location_of_employment, String, null: false
    field :first_position, String, null: false
    field :negotiation, String, null: false
  end
end
