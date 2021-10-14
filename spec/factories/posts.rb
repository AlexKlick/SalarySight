FactoryBot.define do
  factory :post do
    name { "MyString" }
    company { "MyString" }
    salary { 1 }
    previous_education { "MyString" }
    boot_camp_type { 1 }
    dev_title { "MyString" }
    comments { "MyText" }
    state { "MyString" }
    job_hunt_duration { 1 }
    gender { 1 }
    age { 1 }
    years_of_experience { 1 }
  end
end
