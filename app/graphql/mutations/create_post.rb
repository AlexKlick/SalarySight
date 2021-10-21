module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :company, String, required: false
    argument :salary, Integer, required: false
    argument :degree, String, required: false
    argument :position_title, String, required: false
    argument :state, String, required: false
    argument :job_hunt_duration, Integer, required: false
    argument :gender, String, required: false
    argument :age, Integer, required: false
    argument :years_of_experience, Integer, required: false
    argument :grad_year, String, required: false
    argument :type_of_employment, Integer, required: false
    argument :location_of_employment, String, required: false
    argument :negotiation, Integer, required: false
    argument :first_position, String, required: false
    argument :user_id, ID, required: false

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(company:, salary:, degree:, position_title:, state:, job_hunt_duration:, gender:, age:, years_of_experience:, grad_year:, type_of_employment:, location_of_employment:, negotiation:, user_id:, first_position:)

      post = Post.create(company: company, salary: salary, degree: degree, position_title: position_title, state: state, job_hunt_duration: job_hunt_duration, gender: gender, age: age, years_of_experience: years_of_experience, grad_year: grad_year, type_of_employment: type_of_employment, location_of_employment: location_of_employment, negotiation: negotiation, first_position: first_position, user_id: user_id)

      if post.save
        {
          post: post
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
