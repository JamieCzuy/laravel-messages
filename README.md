# laravel-messages

A simple backend for a message app written in PHP using the Laravel Framework

## Overview

* Author: Jamie Czuy
* Hours Taken:
  * 16+ hrs on initial commit (took a while to get familiar with PHP and Laravel and how to get them to work in Docker)
  * 8+ hrs on the actual assignment

Below are my notes on what was done and at the end there is a list of issues and suggestions.

Thank You,
Jamie Czuy

## Vision

* Use Docker to avoid having to install / uninstall different tools and packages while trying different solutions.

## How to Run

### Copy sample.env to .env and edit it

Add project name and db passwords.
The project name is used for grouping the docker containers.

```bash
cp sample.env .env
```

### Spin up MySql Server

```bash
docker compose up -d mysql-db
```

### Spin up the App or run the Tests

To run the Tests use this command

```bash
docker compose run --rm laravel-test
```

And to Spin up the App:

```bash
docker compose up -d laravel-app
```

### Test that app is running

You can open [localhost](http://localhost:8000) in a browser to see that the app is running and available.

### Run Curl Test to Register / Create a User

```bash
cd curl_test
./register_a_user.sh
```

Look in the User table - the new user should be there

## Notes on creating the Initial Commit

These were the steps taken to create the initial commit: this is how the project folder was built.

See the Dockerfile and Compose.yml file for how these steps are defined.

### Create a .env file from sample.env

```bash
cp sample.env .env
```

Now edit .env and replace ????'s with good passwords

### Bring up a MySQL Database

```bash
docker compose up -d mysql-db
```

### Create a base docker image with PHP and Composer

```bash
docker compose build base-image
```

### Create the Laravel Project Folder

Run (spin up) a utility container that creates the laravel project (creates and populates the ./project folder) and then exits

```bash
docker compose run --rm project-create
```

### Use a Docker container to Test the Laravel App

Use a Docker container to Test the Laravel App
Should see: `Tests:    10 passed (21 assertions)`

```bash
docker compose run --rm laravel-test
```

### Bring up the Laravel App

Spin up a container (in daemon mode) that is running the Laravel App from in the project folder that was just created.

```bash
docker compose up -d laravel-app
```

### Check that it is running

Open a browser and go to http://localhost:8000
Should see: `{"Laravel":"11.41.0"}`

```bash
open http://localhost:8000
```

### Monitor the running server and database

Run compose logs to watch the logs for both the database and the app.

```bash
docker compose logs --follow
```

Now we're ready to make changes!!

## Issues and Suggestions

* I think there should be some mention of security in the Endpoint descriptions - like a column Public/Private.
* I'm in favor of doing away with first_name, last_name and just using name for Users.
* I'm also not a fan of numeric auto-increment ids - they expose information about the data. I much prefer UUID's or if they are too long some other unique random string of chars.

### My Journey

I only got one endpoint done: /api/register

I spent a lot of time getting php, laravel, npm, node and vite all running together in a docker container - only to realize (as I learned more about Laravel) that I didn't need npm or node or vite because this was a backend only task.

Breeze was another package that took time - I thought I'd be able to use the /register and /login but got hung up on a CSRF issue.

And then just ran out of time.

I am happy with the docker setup - Once setup it was easy to spin up and down the server and the MySQL database and I have DBeaver running locally to access the database. Next step would be to setup remote debugging in vsCode to be able to set breakpoints and step through the code running in the docker container (I was mainly using logging for debugging).

I am sorry I did not get further. This was a lot of fun learning PHP - a brand new language (to me). And it was fun learning about Laravel - I see a lot of similarities between it and DJango.

Thank You,
Jamie Czuy
