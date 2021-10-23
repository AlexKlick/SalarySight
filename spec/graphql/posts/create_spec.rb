require 'rails_helper'

RSpec.describe 'create post api', type: :request do
  before(:each) do
    @user = create(:user)
  end

  it 'can create a new post' do
    post '/graphql', params: {query: mutation}

    expect(response).to be_successful

    post = JSON.parse(response.body, symbolize_names: true)
require "pry"; binding.pry
    expect(post).to have_key(:data)
    expect(post[:data]).to have_key(:createPost)
    expect(post[:data][:createPost]).to have_key(:post)
    expect(post[:data][:createPost][:post]).to have_key(:company)
    expect(post[:data][:createPost][:post]).to have_key(:salary)
    expect(post[:data][:createPost][:post]).to have_key(:degree)
    expect(post[:data][:createPost][:post]).to have_key(:positionTitle)
    expect(post[:data][:createPost][:post]).to have_key(:jobHuntDuration)
    expect(post[:data][:createPost][:post]).to have_key(:gender)
    expect(post[:data][:createPost][:post]).to have_key(:age)
    expect(post[:data][:createPost][:post]).to have_key(:yearsOfExperience)
    expect(post[:data][:createPost][:post]).to have_key(:gradYear)
    expect(post[:data][:createPost][:post]).to have_key(:typeOfEmployment)
    expect(post[:data][:createPost][:post]).to have_key(:locationOfEmployment)
    expect(post[:data][:createPost][:post]).to have_key(:negotiation)
    expect(post[:data][:createPost][:post]).to have_key(:firstPosition)

    new_post = Post.last

    expect(new_post.username).to eq("example name")
    expect(new_post.company).to eq("Apple")
    expect(new_post.salary).to eq(100000)
    expect(new_post.degree).to eq("Four Year Degree")
    expect(new_post.position_title).to eq('Staff Engineer')
    expect(new_post.state).to eq('CO')
    expect(new_post.job_hunt_duration).to eq(100)
    expect(new_post.gender).to eq("Female")
    expect(new_post.age).to eq("25-34")
    expect(new_post.years_of_experience).to eq(2)
    expect(new_post.grad_year).to eq("2019")
    expect(new_post.type_of_employment).to eq("Part-Time")
    expect(new_post.location_of_employment).to eq("Remote")
    expect(new_post.negotiation).to eq("true")
    expect(new_post.first_position).to eq("Yes")

    salary = Salary.last
    expect(salary.salary).to eq(100000)
  end

  def mutation
    <<~GQL
    mutation {
      createPost(input: {
        company: "Apple"
        username: "example name"
        salary: "100000"
        degree: "Four Year Degree"
        positionTitle: "Staff Engineer"
        state: "CO"
        jobHuntDuration: "100"
        gender: "Female"
        age: "25-34"
        yearsOfExperience: "2"
        gradYear: "2019"
        program: "FE"
        typeOfEmployment: "Part-Time"
        locationOfEmployment: "Remote"
        negotiation: "true"
        firstPosition: "Yes"
        }) {
          post{
            company
            salary
            degree
            positionTitle
            state
            jobHuntDuration
            gender
            age
            yearsOfExperience
            gradYear
            typeOfEmployment
            locationOfEmployment
            firstPosition
            negotiation
          }
        }
      }
      GQL
    end
  end
