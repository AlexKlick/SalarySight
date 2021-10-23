module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :id, ID, required: false
    argument :username, String, required: false
    argument :company, String, required: false
    argument :salary, String, required: false
    argument :degree, String, required: false
    argument :position_title, String, required: false
    argument :state, String, required: false
    argument :job_hunt_duration, String, required: false
    argument :gender, String, required: false
    argument :age, String, required: false
    argument :years_of_experience, String, required: false
    argument :grad_year, String, required: false
    argument :type_of_employment, String, required: false
    argument :location_of_employment, String, required: false
    argument :negotiation, String, required: false
    argument :first_position, String, required: false
    argument :program, String, required: false

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(username:, company:, salary:, degree:, position_title:, state:, job_hunt_duration:, gender:, age:, years_of_experience:, grad_year:, type_of_employment:, location_of_employment:, negotiation:, first_position:, program:)

      post = Post.create(username: username, company: company, salary: salary.to_i, degree: degree, position_title: position_title, state: state, job_hunt_duration: job_hunt_duration.to_i, gender: gender, age: age, years_of_experience: years_of_experience.to_i, grad_year: grad_year, type_of_employment: type_of_employment, location_of_employment: location_of_employment, negotiation: negotiation, first_position: first_position, program: program)

      salary = Salary.create(date: DateTime.now.to_s, salary: salary)

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
