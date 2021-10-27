FactoryBot.define do
  factory :post do
    company { Faker::Company.name }
    salary { Faker::Number.between(from: 60_000, to: 100_000) }
    degree { 'Four Year Degree' }
    position_title { Faker::Job.title }
    state { Faker::Address.state }
    job_hunt_duration { 1 }
    gender { 1 }
    age { 1 }
    years_of_experience { 1 }
    grad_year { '2019' }
    type_of_employment { 1 }
    location_of_employment { 1 }
    negotiation { 1 }
    username { Faker::Name.name }
    program { 1 }
    first_position { 1 }
    position_company { Faker::Company.name }
  end
end
