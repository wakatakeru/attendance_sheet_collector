# Attendance Sheet Collector
## What this?

This is attendance sheet collecting system.

## Requirements
### Deployment with Docker
- Docker

## Installation
### Deployment with Docker
1. `docker-compose build`
2. `docker-compose run --rm app bundle exec rails db:create`
3. `docker-compose run --rm app bundle exec rails db:migrate`
4. `docker-compose up -d`