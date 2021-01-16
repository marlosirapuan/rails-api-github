# API-Github

Small Rails application to handle some informations with GithubAPI.

## Installation (Manual)

Prerequisites
* Ruby: `2.7.2`
* Database: `postgresql`

Use this link below to setup your environment if necessary:
```
https://gorails.com/setup/ubuntu/20.10
```

## Setup

Copy env files:
```sh
cp .env.example .env
```

Install gems and prepare db:
```sh
bin/setup
```

Populate db with seed:
```sh
bin/rails db:seed
```

And start the application:
```sh
bin/rails s
```

The app is ready. Open `http://0.0.0.0:3000`

## Testing

To run the tests:
```sh
bin/rails spec
```

In this project I used `VCR` gem, so If you need recreate the cassettes, use:
```sh
VCR_MODE=rec bin/rails spec
```

## Extras

Rubocop (code analyzer / linter)
```sh
rubocop
```

If you need to edit the credentials:
```sh
EDITOR=vim bin/rails credentials:edit
```

---

## Installation (Docker)

https://docs.docker.com/compose/install/

You can install and run this application with Docker-compose. Run the command below and wait for the build application to start (first time takes a while):
```
docker-compose up
```

When shows this message:
```
api_github_app | Puma starting in single mode...
api_github_app | * Puma version: 5.1.1 (ruby 2.7.2-p137) ("At Your Service")
api_github_app | *  Min threads: 5
api_github_app | *  Max threads: 5
api_github_app | *  Environment: development
api_github_app | *          PID: 1
api_github_app | * Listening on http://0.0.0.0:3000
api_github_app | Use Ctrl-C to stop
```

The app is ready. Open `http://0.0.0.0:3000` and use.

---

## Application details

TODO

## Examples

You can use cURL to test manually the application. First, run the seed (if you’ve already run, you don’t need to repeat this step):

```sh
bin/rails seed
```

Next, run the application:
```sh
bin/rails s
```

### Authenticate

Authenticate to receive the access token
```sh
curl -X POST "http://localhost:3000/api/v1/auth" \
  -H "Content-Type: application/json" \
  -d '{"email": "demo@demo.com", "password": "demo"}'
```

Response with your token:
```json
{"token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MTA4MjA1NzB9.EWFWXXbTpUbHFLRuaw4uR5-eLDXt7VjFBmmnMoMBORg"}
```

### Repositories

List repositories from Github

```sh
curl -X GET "http://localhost:3000/api/v1/repositories" \
  -H "Content-Type: application/json" \
  -H "Authorization: YOUR-TOKEN-HERE"
```

Response for request:
```json
{"data":{"paginate":{"total_count":58769490,"page":1,"per_page":5},"repositories":[{"name":"X140Yu/Developing_iOS_8_Apps_With_Swift","description":"Stanford 公开课，Developing iOS 8 Apps with Swift 字幕翻译","stars":2700,"forks":502,"author":"X140Yu"},{"name":"ocombe/ocLazyLoad","description":"Lazy load modules \u0026 components in AngularJS","stars":2667,"forks":540,"author":"ocombe"},{"name":"beworker/pinned-section-listview","description":"Easy to use ListView with pinned sections for Android.","stars":2631,"forks":847,"author":"beworker"},{"name":"nitin42/react-imgpro","description":"📷  Image Processing Component for React","stars":2156,"forks":105,"author":"nitin42"},{"name":"nicolaschengdev/WYPopoverController","description":"WYPopoverController is for the presentation of content in popover on iPhone / iPad devices. Very customizable.","stars":1971,"forks":381,"author":"nicolaschengdev"}]}}
```

Parameters allowed:
- **type**: type of repositories
  - public | private (default is 'public')
- **page**: current page
  - 1
- **per_page**: total results per page
  - 5

Example:
```sh
curl -X GET "http://localhost:3000/api/v1/repositories?page=1&per_page=10" \
  -H "Content-Type: application/json" \
  -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MTA4MjA1NzB9.EWFWXXbTpUbHFLRuaw4uR5-eLDXt7VjFBmmnMoMBORg"
```
