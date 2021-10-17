[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SalarySight">
    <img src="https://user-images.githubusercontent.com/80132364/137375953-5d3e2034-ce5a-403b-94c9-3dd16f804c73.png" alt="Logo" width="120" height="120">
  </a>

  <h3 align="center">SalarySight</h3>

  <p align="center">
    An app to checkout BootCamp Grad Salaries
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


<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

This is a Rails application using GraphQL for the API. Other technologies used to create this application are:

* [Ruby on Rails v 5.2.6](https://rubyonrails.org/)
* [Ruby v 2.7.2](https://www.ruby-lang.org/en/)
* [GraphQL](https://graphql.org/)

Gems used to to build this application:
* [graphql](https://github.com/rmosolgo/graphql-ruby)
* [graphiql](https://github.com/rmosolgo/graphiql-rails)

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
   cd SalarySight
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

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Queries

HTTP Verb | Endpoint      | Type              | Description                              | Link
----------|---------------|-------------------|------------------------------------------|---------------------------
POST      | `/graphql`    | `Posts`           | Get All Posts          | [Link](#posts)
POST      | `/graphql`    | `User`            | Get One User           | [Link](#user)

---

<p align="right">(<a href="#top">back to top</a>)</p>

### Posts

Returns all Posts and any attributes included in the query.

```graphql
    query {
      posts {
        id
        name
        company
        salary
        previousEducation
        bootCampType
        devTitle
        comments
        state
        jobHuntDuration
        gender
        age
        yearsOfExperience
      }
    }
```

### Query Attributes

Name        | Data Type | Description
------------|-----------|-------------------
`id`        | BigInt    | ID of Record
`name`      | String    | Name of person who created the post (if available)
`company`      | String    | Name of company the poster received a job with (if available)
`salary`      | Integer    | Starting salary of the position
`previousEducation`      | String    | Poster's highest education
`bootCampType`      | Integer  | In person, virtual, or a hybrid of both
`devTitle`      | String    | Title of the position
`state`      | String    | State in which the position was acquired
`jobHuntDuration`      | Integer    | Length in time it took Poster to receive a position
`gender`      | Integer    | Gender of Poster (Male, Female, Transgender, Non-binary/non-conforming, other, prefer not to say)
`age`      | Integer    | Age of Poster
`yearsOfExperience`      | Integer    | Years of Experience for position
`comments`      | Text    | Any Comments poster wishes to share with dev team

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
              "name": "Example Name",
              "company": "Example Company",
              "salary": 100000,
              "previousEducation": "Four Year Degree",
              "bootCampType": 1,
              "devTitle": "Software Engineer",
              "comments": "Any Comments that the Poster may have",
              "state": "Colorado",
              "jobHuntDuration": 1,
              "gender": 0,
              "age": 29,
              "yearsOfExperience": 1
            },
            {
              "id": "43",
              "name": "Another Example Name",
              "company": "Another Example Company",
              "salary": 120000,
              "previousEducation": "No Degree",
              "bootCampType": 1,
              "devTitle": "Software Engineer",
              "comments": "Any Comments that the Poster may have",
              "state": "California",
              "jobHuntDuration": 1,
              "gender": 1,
              "age": 26,
              "yearsOfExperience": 0
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
          "email": "example email",
          "imageUrl": "https://exampleurl.com/example.jpeg",
          "token": "examplegithubtoken"
     }
 }
```
---



<!-- CONTRIBUTING -->
## Mutations

HTTP Verb | Endpoint      | Type              | Description                              | Link
----------|---------------|-------------------|------------------------------------------|---------------------------
POST      | `/graphql`    | `createUser`      | Create a New User                        | [Link](#create-user)

---

<p align="right">(<a href="#top">back to top</a>)</p>

### Create User

Returns all Posts and any attributes included in the query.

```graphql
    mutation {
      CreateUser(input: {
        nickname: "example name"
        email: "example email"
        imageUrl: "example.example.com"
        token: "examplegithubtoken"
      }) {
        user {
         nickname
         email
         imageUrl
         token
         }
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
    "createUser": {
      "user": {  
          "nickname": "example nickname",
          "email": "example email",
          "imageUrl": "https://exampleurl.com/example.jpeg",
          "token": "examplegithubtoken"
          }
     }
 }
```
---


<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#top">back to top</a>)</p>

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
