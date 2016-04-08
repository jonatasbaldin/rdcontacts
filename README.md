# RDContacts

## What is RDContacts?
RDContacts is an opensource application that allow users to store its contacts. You can even create custom fields, but, for now, you cannot add custom information to contacts through the web interface, this feature is currently under development.

## How to build locally
What do you need?

* Ruby 2.3.0
* Rails 4.2.6
* Linux OS

1. Clone this repository `git clone https://github.com/jonatasbaldin/rdcontacts.git`
2. Install necessary gems (no production): `bundle install --without production`
3. Create the database `bundle exec rake db:migrate`
3. Create the database in the test env `bundle exec rake db:migrate RAILS_ENV=test`
4. Execute the tests `bundle exec rake test`
5. Start Rails webserver `rails server`

## Roadmap
RDContacts is a small app built in 4 days (fewer hours)! We have many things to improve, here's our list:

* Add custom information for custom fields
* Add error pages
* Improve user profiles (more data, picture)
* Import contacts from third-party sources
* Improve password complexity
* Other little details

If you want to contribute, just send your pull request!
