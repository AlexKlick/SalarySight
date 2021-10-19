module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :company, String, required: false
    argument :salary, Integer, required: false
    argument :previous_education, String, required: false
    argument :boot_camp_type, Integer, required: false
    argument :dev_title, String, required: false
    argument :comments, String, required: false
    argument :state, String, required: false
    argument :job_hunt_duration, Integer, required: false
    argument :gender, Integer, required: false
    argument :age, Integer, required: false
    argument :years_of_experience, Integer, required: false

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(name:, company:, salary:, previous_education:, boot_camp_type:, dev_title:, comments: nil, state:, job_hunt_duration:, gender:, age:, years_of_experience:)
      post = Post.create(name: name, company: company, salary: salary, previous_education: previous_education, boot_camp_type: boot_camp_type, dev_title: dev_title, comments: comments, state: state, job_hunt_duration: job_hunt_duration, gender: gender, age: age, years_of_experience: years_of_experience)

      if post.save
        {
          post: post
        }
      else
        {
          post: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
