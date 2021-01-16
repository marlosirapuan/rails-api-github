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

Start the application:
```sh
bin/rails s
```

The app is ready. Open `http://0.0.0.0:3000` and use.

## Testing

To run the tests, run:
```sh
bin/rails spec
```

In this project I used `VCR` gem, so If you need recreate the cassettes, use:
```sh
VCR_MODE=rec bundle exec rspec
```

## Extras

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

# Application details

TODO
