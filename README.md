## About This Project:

[Sweater Weather](https://github.com/Callbritton/sweater_weather) is an API based application that consumes multiple APIs, aggregates their data, and returns JSON to be exposed by a hypothetical front end.

## Table of Contents
* [Local Setup](https://github.com/Callbritton/sweater_weather/blob/main/README.md#local-setup-)
* [Deployment](https://github.com/Callbritton/sweater_weather/blob/main/README.md#deployment-)
* [Endpoints](https://github.com/Callbritton/sweater_weather/blob/main/README.md#endpoints-)
* [Schema](https://github.com/Callbritton/sweater_weather/blob/main/README.md#schema-)

## Local Setup <a name="local-setup"></a>

This project requires:
- Ruby 2.5.3.
- Rails 5.2.4.3

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:create`
    * `rails db:migrate`

**Relocate-Back-End utilizes the following gems and libraries (included in gem file):**

- [RSpec](https://github.com/rspec/rspec-rails)
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
- [Capybara](https://github.com/teamcapybara/capybara)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [Faraday](https://github.com/lostisland/faraday)
- [Figaro](https://github.com/laserlemon/figaro)
- [Fast JsonAPI](https://github.com/Netflix/fast_jsonapi)
- [Bcyrpt](https://github.com/codahale/bcrypt-ruby)

* Secure API keys from:
  * [Open Weather](https://openweathermap.org/api)
  * [Unsplash](https://unsplash.com/)
  * [Mapquest](https://developer.mapquest.com/)

* Install Figaro with `bundle exec figaro install` to create an application.yml file locally (this is where you will store your ENV variables and api_keys)

* Set your ENV variables in the application.yml file:
  * `WEATHER_API_KEY: "<your api key>"`
  * `MAP_API_KEY: "<your api key>"`
  * `IMAGE_API_KEY: "<your api key>"`

## Deployment <a name="deployment"></a>

This application is deployed locally. type `rails s` to run your local development server.

With rails server running, you will be able to send requests through http://localhost:3000/

[Postman](https://www.postman.com/) is highly recommended for viewing available responses.

## Endpoints <a name="endpoints"></a>

#### Retrieve weather for a city

**Request:**

GET `localhost:3000/api/v1/forecast?location=denver,co`

**Example Response:**

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-01-16 11:35:45 -0500",
                "sunrise": "2021-01-16 09:18:33 -0500",
                "sunset": "2021-01-16 19:00:41 -0500",
                "temperature": 40.12,
                "feels_like": 33.49,
                "humidity": 46,
                "uvi": 1.05,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04d"
            },
            "daily_weather": [
                {
                    "date": "Saturday, January 16 2021",
                    "sunrise": "2021-01-16 09:18:33 -0500",
                    "sunset": "2021-01-16 19:00:41 -0500",
                    "max_temp": 43.65,
                    "min_temp": 34.11,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "Sunday, January 17 2021",
                    "sunrise": "2021-01-17 09:18:07 -0500",
                    "sunset": "2021-01-17 19:01:48 -0500",
                    "max_temp": 44.31,
                    "min_temp": 33.03,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "Monday, January 18 2021",
                    "sunrise": "2021-01-18 09:17:38 -0500",
                    "sunset": "2021-01-18 19:02:55 -0500",
                    "max_temp": 37.94,
                    "min_temp": 28.53,
                    "conditions": "snow",
                    "icon": "13d"
                },
                {
                    "date": "Tuesday, January 19 2021",
                    "sunrise": "2021-01-19 09:17:07 -0500",
                    "sunset": "2021-01-19 19:04:03 -0500",
                    "max_temp": 31.28,
                    "min_temp": 25.99,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                    "date": "Wednesday, January 20 2021",
                    "sunrise": "2021-01-20 09:16:35 -0500",
                    "sunset": "2021-01-20 19:05:12 -0500",
                    "max_temp": 47.32,
                    "min_temp": 27.66,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "11:00:00",
                    "temperature": 40.12,
                    "wind_speed": "3.06 mph",
                    "wind_direction": "S",
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "12:00:00",
                    "temperature": 38.91,
                    "wind_speed": "4.52 mph",
                    "wind_direction": "S",
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "13:00:00",
                    "temperature": 40.26,
                    "wind_speed": "5.66 mph",
                    "wind_direction": "SSE",
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "14:00:00",
                    "temperature": 42.1,
                    "wind_speed": "4.12 mph",
                    "wind_direction": "SE",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "15:00:00",
                    "temperature": 43.5,
                    "wind_speed": "5.77 mph",
                    "wind_direction": "E",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "16:00:00",
                    "temperature": 43.65,
                    "wind_speed": "5.91 mph",
                    "wind_direction": "E",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "17:00:00",
                    "temperature": 43.5,
                    "wind_speed": "4.09 mph",
                    "wind_direction": "ESE",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "18:00:00",
                    "temperature": 42.75,
                    "wind_speed": "5.68 mph",
                    "wind_direction": "SSE",
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    }
}
```

#### Retrieve background image for the city

**Request:**

GET `localhost:3000/api/v1/backgrounds?location=denver,co`

**Example Response:**

```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTkxMTd8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
            "description": "man in blue jacket and black pants riding on snowboard during daytime",
            "credit": {
                "source": "Unsplash.com",
                "author": "Michael Kilcoyne"
            }
        }
    }
}
```
#### User Registration

**Request:**

GET `localhost:3000/api/v1/users`

JSON payload in body of request:

```
{
  "email": "email@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

**Example Response:**

```
{
    "data": {
        "id": "270",
        "type": "users",
        "attributes": {
            "email": "email@example.com",
            "api_key": "<users key>"
        }
    }
}
```

**Request:**

GET `localhost:3000/api/v1/sessions`

JSON payload in body of request:

```
{
  "email": "email@example.com",
  "password": "password"
}
```

**Example Response:**

```
{
    "data": {
        "id": "270",
        "type": "users",
        "attributes": {
            "email": "email@example.com",
            "api_key": "<users key>"
        }
    }
}
```

**Request:**

GET `localhost:3000/api/v1/road_trip`

JSON payload in body of request:

```
{
    "origin": "Denver, CO",
    "destination": "Pueblo, CO",
    "api_key": "<user api_key>"
}
```

**Example Response:**

```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Pueblo, CO",
            "travel_time": "01:44:22",
            "weather_at_eta": {
                "temperature": 29.61,
                "conditions": "overcast clouds"
            }
        }
    }
}
```

## Schema <a name="schema"></a>

<img width="490" alt="Sweater Weather Schema" src="https://user-images.githubusercontent.com/63476564/105051484-cdaaea00-5a3c-11eb-9226-7c3f36a6702d.png">
