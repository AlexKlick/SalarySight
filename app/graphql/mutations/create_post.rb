module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :company, String, required: false
    argument :salary, Integer, required: false
    argument :previous_education, String, required: false
    argument :dev_title, String, required: false
    argument :state, String, required: false
    argument :job_hunt_duration, Integer, required: false
    argument :gender, Integer, required: false
    argument :age, Integer, required: false
    argument :years_of_experience, Integer, required: false
    argument :year_graduated, String, required: false
    argument :type_of_employment, String, required: false
    argument :location_of_employment, String, required: false
    argument :negotiation, Integer, required: false
    argument :user_id, ID, required: false

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(company:, salary:, previous_education:, dev_title:, state:, job_hunt_duration:, gender:, age:, years_of_experience:, year_graduated:, type_of_employment:, location_of_employment:, negotiation:, user_id:)

      post = Post.create(company: company, salary: salary, previous_education: previous_education, dev_title: dev_title, state: state, job_hunt_duration: job_hunt_duration, gender: gender, age: age, years_of_experience: years_of_experience, year_graduated: year_graduated, type_of_employment: type_of_employment, location_of_employment: location_of_employment, negotiation: negotiation, user_id: user_id)

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
