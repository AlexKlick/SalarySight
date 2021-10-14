[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
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
POST      | `/graphql`    | `Posts`           | Get the forecast for a location          | [Link](#posts)

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
`company`      | String    | Name of person who created the post (if available)
`salary`      | String    | Name of person who created the post (if available)
`previousEducation`      | String    | Name of person who created the post (if available)
`bootCampType`      | String    | Name of person who created the post (if available)
`devTitle`      | String    | Name of person who created the post (if available)
`state`      | String    | Name of person who created the post (if available)
`jobHuntDuration`      | String    | Name of person who created the post (if available)
`gender`      | String    | Name of person who created the post (if available)
`age`      | String    | Name of person who created the post (if available)
`yearsOfExperience`      | String    | Name of person who created the post (if available)
`comments`      | String    | Name of person who created the post (if available)

Notes: 
Units is an optional parameter. The default response will be in imperial units. To return metric values, include metric with the key units in params

### Example Response

```
Status: 200 OK
```

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-09-28 13:31:36 -0700",
                "conditions": "clear sky",
                "temperature": 89.9,
                "humidity": 36,
                "feels_like": 89.3,
                "uvi": 5.43,
                "visibility": 10000,
                "sunrise": "2021-09-28 06:29:56 -0700",
                "sunset": "2021-09-28 18:25:47 -0700"
            },
            "daily_weather": [
                {
                    "date": "2021-09-29",
                    "sunrise": "2021-09-29 06:30:40 -0700",
                    "sunset": "2021-09-29 18:24:22 -0700",
                    "max_temp": 86.7,
                    "min_temp": 72.3,
                    "conditions": "overcast clouds",
                    "icon": "http://openweathermap.org/img/w/04d.png"
                },
                { ... }
            ],
            "hourly_weather": [
                {
                    "time": "14:00:00",
                    "temperature": 89.9,
                    "conditions": "clear sky",
                    "icon": "http://openweathermap.org/img/w/01d.png"
                },
                { ... }
            ]
        }
    }
}
```

---



<!-- CONTRIBUTING -->
## Mutations

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>


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
