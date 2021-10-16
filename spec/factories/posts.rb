FactoryBot.define do
  factory :post do
    name { Faker::Name.name }
    company { Faker::Company.name }
    salary { Faker::Number.between(from: 60000, to: 100000) }
    previous_education { "Four Year Degree" }
    boot_camp_type { 1 }
    dev_title { Faker::Job.title  }
    comments { Faker::ChuckNorris.fact }
    state { Faker::Address.state }
    job_hunt_duration { 1 }
    gender { 1 }
    age { 1 }
    years_of_experience { 1 }
  end
end
