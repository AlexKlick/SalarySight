<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SalarySight">
    <img src="https://user-images.githubusercontent.com/80132364/137375953-5d3e2034-ce5a-403b-94c9-3dd16f804c73.png" alt="Logo" width="250" height="250">
  </a>

  <h3 align="center">SalarySight</h3>

  <p align="center">
    Ensuring Turing Graduates get the Salary they Deserve
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#queries">Queries</a></li>
    <li><a href="#mutations">Mutations</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project is intented for students at Turing School of Software and Design to use as a reference for comparing job salaries. The overall objective for this project give Turing students the opportunity to share their experience in the hiring process and to ensure students can be confident in negotiating salaries and receiving equality in their job offers. Students can login using their GitHub account and filter data on the front end to see what they deserve in terms on a software engineering salary. If a user has taken an offer with a company, they can post that information which will be included in the data that other users can view. This projects was build in roughly 3 weeks, with a frontend team and a backend team using an agile workflow. Check out the deployed application [here](https://salary-sight.herokuapp.com/). 


<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

This is a Rails application using GraphQL for the API. Other technologies used to create this application are:

* [Ruby on Rails v 5.2.6](https://rubyonrails.org/)
* [Ruby v 2.7.2](https://www.ruby-lang.org/en/)
* [GraphQL](https://graphql.org/)

Gems used to to build this application:
* [graphql](https://github.com/rmosolgo/graphql-ruby)
* [graphiql](https://github.com/rmosolgo/graphiql-rails)
* [figaro](https://github.com/laserlemon/figaro)

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started


### Prerequisites

In order to run this application locally, you will need 
* rails 5.2.6
* ruby 2.7.2
* [PostgreSQL](https://www.postgresql.org/docs/9.5/functions-aggregate.html)

### Installation

1. Clone the repo
   ```
   git clone git@github.com:SalarySight/SalarySight-BE.git
   ```
2. Change directory
   ```
   cd SalarySight-BE
   ```
3. Install gems
   ```
   bundle install
   ```
4. Create local DB
   ```
   rails db:create
   rails db:migrate
   ```
5. This application uses Oauth through GitHub to authenticate users. Please see the Github docs [here](https://docs.github.com/en/developers/apps/building-oauth-apps/creating-an-oauth-app) to recieve your own client id and client secret from GitHub. Install [figaro](https://github.com/laserlemon/figaro) by running this command.
   ```
   bundle exec figaro install 
   ```
6. Enter your Oauth client id and client secret in the newly created `config/application.yml` file
    ```
    client_id: <client-id goes here>
    client_secret: <client-secret goes here>
    ```
   
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

The best way to query data is to use [Postman](https://www.postman.com/). If you do not have Postman installed, download it to get started. Open Postman to begin a query, and open a new tab to get started. Within the tab, change the HTTP method in the drop down menu on the upper left to `POST`. In the `Enter request URL` section, enter `http://localhost:3000/graphql`. Fire up the server locally by running `rails s` or `rails server` from the command line.

Now we can setup a GraphQL mutation. Under the `URL` section, click on `Body`. This opens a window where text can be entered to send through the body of a request. Now, on the middle navbar, below `URL`, click the `GraphQL` checkbox. This opens a query section to enter GraphQL queries. Using the tables below as a reference, enter your query on the left window, and when ready, click on the blue `Send` button on the upper left part of the screen to send the request to the server. 


<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Queries

HTTP Verb | Endpoint      | Type              | Description                              | Link
----------|---------------|-------------------|------------------------------------------|---------------------------
POST      | `/graphql`    | `Posts`           | Get All Posts                            | [Link](#posts)
POST      | `/graphql`    | `User`            | Get One User                             | [Link](#user)
POST      | `/graphql`    | `Salary`          | Get the median of all Salaries           | [Link](#median-salary)

---

<p align="right">(<a href="#top">back to top</a>)</p>

### Posts

Returns all Posts and any attributes included in the query.

```graphql
   query {
      posts {
        id
        username
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
        program
      }
    }
```

### Query Attributes

Name        | Data Type | Description
------------|-----------|-------------------
`id`        | BigInt    | ID of Record
`username`        | String    | Name of Poster
`company`      | String    | Name of company the poster received a job with (if available)
`salary`      | Integer    | Starting salary of the position
`degree`      | String    | Poster's highest education
`positionTitle`      | String    | Title of the position
`program`      | String    | Engineering program the Poster attended in school
`state`      | String    | State in which the position was acquired
`jobHuntDuration`      | Integer    | Length in time it took Poster to receive a position
`gender`      | String  | Gender of Poster (Male, Female, Transgender, Non-binary/non-conforming, other, prefer not to say)
`age`      | Integer    | Age of Poster
`yearsOfExperience`      | Integer    | Years of Experience for position
`yearGraduated`      | String  | Year the Poster graduated
`typeOfEmployment`      | String  | Type of employment received (i.e. full time)
`locationOfEmployment`      | String  | Location of Position received
`negotiation`      | String  | Yes or No for negotiating offer received
`firstPosition`      | String  | True of False for first position in the industry

### Example Response

```
Status: 200 OK
```

```json
{ 
"data": {
     "posts": [
           {
              "id": "42",
              "username": "Example Username",
              "company": "Example Company",
              "salary": 100000,
              "degree": "Four Year Degree",
              "positionTitle": "Software Engineer",
              "state": "Colorado",
              "jobHuntDuration": 45,
              "gender": "Female",
              "age": 29,
              "yearsOfExperience": 1,
              "program": "backend",
              "gradYear": "2019",
              "typeOfEmployment": "Full Time",
              "locationOfEmployment": "remote",
              "negotiation": "true",
              "firstPosition": "yes"
            },
            {
              "id": "43",
              "username": "Another Example Username",
              "company": "Another Example Company",
              "salary": 90000,
              "degree": "No Degree",
              "positionTitle": "Associate Software Engineer",
              "state": "California",
              "jobHuntDuration": 90,
              "gender": "Male",
              "age": 33,
              "yearsOfExperience": 1,
              "program": "frontend",
              "gradYear": "2020",
              "typeOfEmployment": "Full-Time",
              "locationOfEmployment": "hybrid",
              "negotiation": "true",
              "firstPosition": "yes"
             }
         ]
     }
 }
```

---

### User

Returns one user with the user's id as an argument.

```graphql
    query {
      user(id: <user-id>) {
        nickname
        email
        imageUrl
        token
      }
    }
```

### Query Attributes

Name        | Data Type | Description
------------|-----------|-------------------
`nickname`      | String    | GitHub Users Account Nickname
`email`      | String    | Email of GitHub User
`imageUrl`      | String    | Image URL of GitHub User's Account
`token`      | String    | Token from GitHub Response

### Example Response

```
Status: 200 OK
```

```json
{ 
"data": {
     "user": {
          "nickname": "example nickname",
          "email": "example@email.com",
          "imageUrl": "https://exampleurl.com/example.jpeg",
          "token": "examplegithubtoken"
         }
     }
 }
```
---

### Median Salary

Returns the median of all Salaries in the database.

```graphql
   query {
    salary {
     medianSalary
      }
    }
```

### Query Attributes

Name        | Data Type | Description
------------|-----------|-------------------
`medianSalary` | Integer    | Median Salary

### Example Response

```
Status: 200 OK
```

```json
{ 
"data": {
     "salary": {
          "medianSalary": 90000
         }
     }
 }
```
---



<!-- CONTRIBUTING -->
## Mutations

HTTP Verb | Endpoint      | Mutation          | Description                              | Link
----------|---------------|-------------------|------------------------------------------|---------------------------
POST      | `/graphql`    | `createPost`      | Create a New Post                        | [Link](#create-post)

---

<p align="right">(<a href="#top">back to top</a>)</p>

### Create Post

Creates a new salary post.

```graphql
     mutation {
      createPost(input: {
        username: "Example Name"
        company: "Example Company"
        salary: 100000
        degree: "Four Year Degree"
        positionTitle: "Staff Engineer"
        state: "Colorado"
        jobHuntDuration: 1
        gender: 1
        age: 29
        yearsOfExperience: 2
        gradYear: "2019"
        program: "FE"
        typeOfEmployment: "Full-Time"
        locationOfEmployment: "Remote"
        negotiation: "Yes"
        firstPosition: "Yes"
        }) {
          post {
            id
            username
            company
            salary
            degree
            positionTitle
            state
            jobHuntDuration
            gender
            age
            yearsOfExperience
            yearGraduated
            typeOfEmployment
            locationOfEmployment
            negotiation
            firstPosition
            program
          }
        }
      }
```
 
### Mutation Arguments

Name        | Data Type | Description
------------|-----------|-------------------
`username`        | String    | Name of Poster
`company`      | String    | Name of company the poster received a job with (if available)
`salary`      | Integer    | Starting salary of the position
`degree`      | String    | Poster's highest education
`positionTitle`      | String    | Title of the position
`program`      | String    | Engineering program the Poster attended in school (see notes below)
`state`      | String    | State in which the position was acquired
`jobHuntDuration`      | Integer    | Length in time it took Poster to receive a position
`gender`      | String  | Gender of Poster (Male, Female, Transgender, Non-binary/non-conforming, other, prefer not to say)
`age`      | Integer    | Age of Poster
`yearsOfExperience`      | Integer    | Years of Experience for position
`yearGraduated`      | String  | Year the Poster graduated
`typeOfEmployment`      | String  | Type of employment received (see notes below)
`locationOfEmployment`      | String  | Location of Position received (see notes below)
`negotiation`      | String  | Yes or No for negotiating offer received
`firstPosition`      | String  | True of False for first position in the industry (see notes below)

Notes
- `program` needs to be sent through the request as `BE` for backend or `FE` for frontend
- `firstPosition` needs to be sent through as either `Yes` or `No`
- `typeOfEmployment` needs to be sent through as `Part-Time`, `Full-Time`, `Contract`, or `Intern/Apprentice`
- `locationOfEmployment` needs to be sent through as `In-Person`, `Hybrid`, or `Remote`

### Example Response

```
Status: 200 OK
```

```json
{
  "data": {
      "createPost": {
        "post": {
          "username": "Example Name"
          "company": "Example Company",
          "salary": 100000,
          "degree": "Four Year Degree",
          "positionTitle": "Staff Engineer",
          "state": "Colorado",
          "jobHuntDuration": 1,
          "gender": 1,
          "age": 29,
          "yearsOfExperience": 2,
          "gradYear": "2019"
          "program": "FE"
          "typeOfEmployment": "Full-Time"
          "locationOfEmployment": "Remote"
          "negotiation": "Yes"
          "firstPosition": "Yes"
          }
       }
    }
 }
```
---


<!-- CONTACT -->
## Contact

<div align="center">
<img src="https://media.giphy.com/media/llKJGxQ1ESmac/giphy.gif" alt="Logo" width="350" height="250">
 </div>



### Backend Engineers
1. 😃 Matt Toensing - [LinkedIn](https://linkedin.com/in/matt-toensing/) - [Email](mailto:matthew.toensing@gmail.com) - [GitHub](https://github.com/matttoensing) - [@instagram](https://www.instagram.com/matt_rtoensing/)
2. 🤓 Alex Klick - [LinkedIn](https://linkedin.com/in/alex-klick/) - [Email](mailto:aklick12@gmail.com) - [GitHub](https://github.com/alexklick)

### Frontend Engineers
1. 😎 Darla Evans - [LinkedIn](https://www.linkedin.com/in/darla-evans/) - [Email](mailto:darlaevans2000@gmail.com) - [GitHub](https://github.com/darlaevans2000)
2. 😁 Erica Spitz - [LinkedIn](https://www.linkedin.com/in/e-spitz/) - [Email](mailto:ericaspitz522@gmail.com) - [GitHub](https://github.com/e-spitz)

Project Link: [SalarySight](https://github.com/SalarySight)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments


* [Turing School of Software and Design](https://turing.edu/)
* GitHub 

<div align="center">
<img src="https://media.giphy.com/media/du3J3cXyzhj75IOgvA/giphy.gif" alt="Logo" width="250" height="250">
 </div>




<p align="right">(<a href="#top">back to top</a>)</p>

