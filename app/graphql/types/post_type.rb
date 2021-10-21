module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :company, String, null: true
    field :salary, Integer, null: true
    field :degree, String, null: true
    field :position_title, String, null: true
    field :state, String, null: true
    field :job_hunt_duration, Integer, null: true
    field :gender, String, null: true
    field :age, Integer, null: true
    field :years_of_experience, Integer, null: true
    field :grad_year, Integer, null: true
    field :username, String, null: true
    field :program, String, null: true
    field :first_position, String, null: true
    field :type_of_employment, String, null: true
    field :location_of_employment, String, null: true
    field :first_position, String, null: true
    field :negotiation, String, null: true
  end
end
