# Bitlog Server

[![Cirrus CI](https://img.shields.io/cirrus/github/moonad/Bitlog?style=for-the-badge)](https://cirrus-ci.com/github/moonad/Bitlog)
[![Coveralls github](https://img.shields.io/coveralls/github/moonad/Bitlog?style=for-the-badge)](https://coveralls.io/github/moonad/Bitlog)

## Description

This app is built with [Phoenix Framework](https://www.phoenixframework.org).

## Installation

```bash
$ mix deps.get
```

## Running the app

Before starting the server, you need to start all external dependencies, create the database and run migrations:

```bash
# start dependencies
$ docker-compose up -d

# create database
$ mix ecto.create

# run migrations
$ mix ecto.migrate
```

And then you just need to start the server with one of the two commands below:

```bash
# start server in development
$ mix phx.server

# start server in development with a interactive shell
$ iex -S mix phx.server
```

## Test and Checks

```bash
# run all tests and checks
$ mix check
```