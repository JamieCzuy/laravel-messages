# laravel-messages

A simple backend for a message app written in PHP using the Laravel Framework

## Overview

* Author: Jamie Czuy
* Hours Taken:
  * 16 hrs on initial commit (took a while to get familiar with PHP and Laravel and how to get them to work in Docker)
  * 3 hrs on the actual assignment

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

### TODO: Load the database with a dump

```bash
# docker compose run --rm load-test-data
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

