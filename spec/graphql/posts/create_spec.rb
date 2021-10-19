require 'rails_helper'

RSpec.describe 'create post api', type: :request do
  before(:each) do
    @user = create(:user)
  end

  it 'can create a new post' do
    post '/graphql', params: {query: mutation}

    expect(response).to be_successful

    post = JSON.parse(response.body, symbolize_names: true)

    expect(post).to have_key(:data)
    expect(post[:data]).to have_key(:createPost)
    expect(post[:data][:createPost]).to have_key(:post)
    expect(post[:data][:createPost][:post]).to have_key(:company)
    expect(post[:data][:createPost][:post]).to have_key(:salary)
    expect(post[:data][:createPost][:post]).to have_key(:previousEducation)
    expect(post[:data][:createPost][:post]).to have_key(:devTitle)
    expect(post[:data][:createPost][:post]).to have_key(:jobHuntDuration)
    expect(post[:data][:createPost][:post]).to have_key(:gender)
    expect(post[:data][:createPost][:post]).to have_key(:age)
    expect(post[:data][:createPost][:post]).to have_key(:yearsOfExperience)
    expect(post[:data][:createPost][:post]).to have_key(:yearGraduated)
    expect(post[:data][:createPost][:post]).to have_key(:typeOfEmployment)
    expect(post[:data][:createPost][:post]).to have_key(:locationOfEmployment)
    expect(post[:data][:createPost][:post]).to have_key(:negotiation)

    new_post = Post.last

    expect(new_post.company).to eq("Apple")
    expect(new_post.salary).to eq(100000)
    expect(new_post.previous_education).to eq("Four Year Degree")
    expect(new_post.dev_title).to eq('Staff Engineer')
    expect(new_post.state).to eq('Colorado')
    expect(new_post.job_hunt_duration).to eq(1)
    expect(new_post.gender).to eq(1)
    expect(new_post.age).to eq(29)
    expect(new_post.years_of_experience).to eq(2)
    expect(new_post.year_graduated).to eq("2019")
    expect(new_post.type_of_employment).to eq("Full Time")
    expect(new_post.location_of_employment).to eq("Denver")
    expect(new_post.negotiation).to eq(1)
  end

  def mutation
    <<~GQL
    mutation {
      createPost(input: {
        company: "Apple"
        salary: 100000
        previousEducation: "Four Year Degree"
        devTitle: "Staff Engineer"
        state: "Colorado"
        jobHuntDuration: 1
        gender: 1
        age: 29
        yearsOfExperience: 2
        yearGraduated: "2019"
        typeOfEmployment: "Full Time"
        locationOfEmployment: "Denver"
        negotiation: 1
        userId: #{@user.id}
        }) {
          post{
            company
            salary
            previousEducation
            devTitle
            state
            jobHuntDuration
            gender
            age
            yearsOfExperience
            yearGraduated
            typeOfEmployment
            locationOfEmployment
            negotiation
          }
        }
      }
      GQL
    end
  end
