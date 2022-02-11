# README - Rails Engine 
##### "Baby builds his first API"

![Frame 2](http://4.bp.blogspot.com/_1OtpoORxJIM/TUhJEOe9eWI/AAAAAAAADIY/yPGvKCFf4x0/s1600/I%2Bthink%2BI%2Bcan_train.jpg)

## Project Description 

This is a back-end project designed to exercise the fundamental basics of exposing an API. You are working for a company developing an E-Commerce Application. Your team is working in a service-oriented architecture, meaning the front and back ends of this application are separate and communicate via APIs. Your job is to expose the data that powers the site through an API that the front end will consume.

Reference: [rails-engine](https://backend.turing.edu/module3/projects/rails_engine_lite/)

## Learning Goals for Rails-Engine:

Explicit
- Expose an API
- Use serializers to format JSON responses 
- Test API exposure 
- Use SQL and AR to gather data

Implicit 
- Reading Documentation 
- Time Management 
- Prioritizing Work 
- Breaking down large project into small pieces 
- Breaking down a problem into small steps 
- Practice individual research (articles, videos, mentors)

### Versions 

- Ruby 2.7.2
- Rails 5.2.6

### Important gems

Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov)

API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers)

### Postman

Download the test suites for Postman:

- [Rails Engine, Section 1](https://backend.turing.edu/module3/projects/rails_engine_lite/RailsEngineSection1.postman_collection.json)
- [Rails Engine, Section 2](https://backend.turing.edu/module3/projects/rails_engine_lite/RailsEngineSection2.postman_collection.json)


Click on each link to load it in your browser, then hit Cmd-S to save it to your system.

In Postman, in the top left corner, click on the “Import” button, and use the file selector to locate the two files on your operating system.

Next, you’ll “confirm” the import. The test suite should display as a “Postman Collection v2.1” and import as a “Collection”. Click the “Import” button to continue.

Within your collections in Postman, you should see two collections– “Rails Engine Lite, Part 1”, and “Rails Engine Lite, Part 2”.

###  - Running the Tests -

There are two ways to run the test suite: one endpoint at a time, or the whole suite.

#### Running one endpoint at a time:

As you develop your endpoints, run “rails s” and find the appropriate endpoint within the Postman collection you imported. For example, “Get All Merchants”. When you select “Get All Merchants” from the list, you should see a Postman tab open, pre-populated with everything you need to connect to the endpoint in your code and see if it works correctly.

Click the “Send” button in the top right corner.

In the lower portion of the Postman interface, you should see “Body”, “Cookies”, “Headers” and a spot that says something like “Test Results (7/7)”. This would indicate that 7 tests passed out of 7. If you see, for example, 3/7 then 3 tests passed and 4 did not. You can click on the “Test Results (7/7)” to see which tests passed.


IMPORTANT some of the endpoints include EDGE CASE testing, which should be saved as “extension” work.

#### Running the full test suite:

In the bottom right corner of the Postman interface, you’ll see a “Runner” button. Click that and a new panel will appear. From here, you can drag one of the three “Rails Engine” collections to the right side of the screen.

Next, you can select/deselect which tests you’d like to run. Finally, click the “Run Rails Engine” button.

As it runs, it will show you which tests are passing or failing.


----------










This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
