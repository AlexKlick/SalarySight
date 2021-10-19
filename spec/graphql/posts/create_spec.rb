require 'rails_helper'

 RSpec.describe 'create post api', type: :request do
   it 'can create a new post' do
     post '/graphql', params: {query: mutation}

     expect(response).to be_successful

     post = JSON.parse(response.body, symbolize_names: true)
  
     expect(post).to have_key(:data)
     expect(post[:data]).to have_key(:createPost)
     expect(post[:data][:createPost]).to have_key(:post)
     expect(post[:data][:createPost][:post]).to have_key(:name)
     expect(post[:data][:createPost][:post]).to have_key(:company)
     expect(post[:data][:createPost][:post]).to have_key(:salary)
     expect(post[:data][:createPost][:post]).to have_key(:previousEducation)
     expect(post[:data][:createPost][:post]).to have_key(:bootCampType)
     expect(post[:data][:createPost][:post]).to have_key(:devTitle)
     expect(post[:data][:createPost][:post]).to have_key(:jobHuntDuration)
     expect(post[:data][:createPost][:post]).to have_key(:gender)
     expect(post[:data][:createPost][:post]).to have_key(:age)
     expect(post[:data][:createPost][:post]).to have_key(:yearsOfExperience)

     new_post = Post.last

     expect(new_post.name).to eq("example name")
     expect(new_post.company).to eq("Apple")
     expect(new_post.salary).to eq(100000)
     expect(new_post.previous_education).to eq("Four Year Degree")
     expect(new_post.boot_camp_type).to eq(1)
     expect(new_post.dev_title).to eq('Staff Engineer')
     expect(new_post.state).to eq('Colorado')
     expect(new_post.job_hunt_duration).to eq(1)
     expect(new_post.gender).to eq(1)
     expect(new_post.age).to eq(29)
     expect(new_post.years_of_experience).to eq(2)
   end

   def mutation
     <<~GQL
     mutation {
       createPost(input: {
         name: "example name"
         company: "Apple"
         salary: 100000
         previousEducation: "Four Year Degree"
         bootCampType: 1
         devTitle: "Staff Engineer"
         state: "Colorado"
         jobHuntDuration: 1
         gender: 1
         age: 29
         yearsOfExperience: 2
       }) {
       post{
         name
         company
         salary
         previousEducation
         bootCampType
         devTitle
         state
         jobHuntDuration
         gender
         age
         yearsOfExperience
       }
       }
     }
     GQL
   end
 end
