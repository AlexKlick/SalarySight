FactoryBot.define do
  factory :post do
    company { Faker::Company.name }
    salary { Faker::Number.between(from: 60000, to: 100000) }
    previous_education { "Four Year Degree" }
    dev_title { Faker::Job.title  }
    state { Faker::Address.state }
    job_hunt_duration { 1 }
    gender { 1 }
    age { 1 }
    years_of_experience { 1 }
    year_graduated { "2019" }
    type_of_employment { "Full Time" }
    location_of_employment { Faker::Address.city  }
    negotiation { 1 }
  end
end
