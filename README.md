# README - Rails Engine 
##### "Baby builds his first API"

![Frame 2](http://4.bp.blogspot.com/_1OtpoORxJIM/TUhJEOe9eWI/AAAAAAAADIY/yPGvKCFf4x0/s1600/I%2Bthink%2BI%2Bcan_train.jpg)

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
      </ul>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
    </li>
    <li>
      <a href="#postman">Postman</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#running-the-test">Running the test</a></li>
  </ol>
</details>

## Project Description 

This is a back-end project designed to exercise the fundamental basics of exposing an API. You are working for a company developing an E-Commerce Application. Your team is working in a service-oriented architecture, meaning the front and back ends of this application are separate and communicate via APIs. Your job is to expose the data that powers the site through an API that the front end will consume.

Reference: [rails-engine](https://backend.turing.edu/module3/projects/rails_engine_lite/)

----------

## Learning Goals for Project:

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

----------

### Versions 

- Ruby 2.7.2
- Rails 5.2.6

----------

### Important gems

Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails)

API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers)

----------

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

### Local Setup 

1.  Fork and Clone the repo 
2.  Install gem packages: 'bundle install' 
3.  Setup the database: 'rails db:create' 
4.  Run migrations: 'rails db:migrate'
5.  Setup [SimpleCov](https://github.com/simplecov-ruby/simplecov) to track test coverage in your rails-engine API project. 
6.  Download [rails-engine-development.pgdump](https://raw.githubusercontent.com/turingschool/backend-curriculum-site/gh-pages/module3/projects/rails_engine/rails-engine-development.pgdump) and move it(just a click and drag) into the '/db/' folder in another folder called '/data/', so your project files look like this: 
  ```md
    /app
    /bin
    /config
    /db
      /data                                               <-- create this folder
        rails-engine-development.pgdump                   <-- put the file in the data folder
        seeds.rb                                            <-- seeds.rb is in '/db/' folder, not '/db/data/'
    /lib 
    /log 
    etc
  ```
7.  Setup your 'db/seeds.rb' file with the following content: 
  ```ruby 
    cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails-engine_development db/data/rails-engine-development.pgdump"
    puts "Loading PostgreSQL Data dump into local database with command:"
    puts cmd
    system(cmd)
  ```
8.  Run 'rake db:{drop,create,migrate,seed}' and you may see lots of output including some warnings/errors from 'pg_restore' that you can ignore. If you're unsure about the errors you're seeing, search the docs. 
9.  Run 'rails db:schema:dump' - Check to see that your 'schema.rb' exists and has the proper tables/attributes that match the data in Postico, if you use that sort of thing. 

----------
### Running the test

Run 'bundle exec rspec' to run the test suite



----------
----------
