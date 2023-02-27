# CSCE606 - Project Plannxt

**Team Spring 2023**

[[Deployed App on Heroku](https://plannxt.herokuapp.com/)]


Instructions given below are based on Cloud9 environment. However, you can use your own machine for develop and testing. The app is deployed on Heroku for production.

### To run in development environment

* Install ruby-3.2.0 using Ruby version manager
  * `rvm get stable`
  * `rvm install "ruby-3.2.0"`
  * `rvm use 3.2.0`

* Install PostgreSQL
  * `sudo apt-get update`
  * `sudo apt-get install postgresql postgresql-contrib libpq-dev`
  * PostgreSQL may require to create a role to allow rails to connect to the Postgre database. In AWS cloud9 ubuntu system, we executed `sudo -u postgres createuser --interactive ubuntu`

* Clone the latest git repo
  * `git clone https://github.com/tian1327/plannxt_Spring2023.git`

* Bundle install
  * `bundle install`
  * `bin/rails db:environment:set RAILS_ENV=development`

* Create and migrate database
  *  `rake db:create`
  *  `rake db:schema:load`
  *  `rake db:migrate`
  *  `rake db:seed`

* Start server in local development environment
  * `rails server`

* To preview the web app in Cloud9
  * Click preview, most likely you will get “IP address mismatch” error
  * Open file `/config/environments/development.rb`, add/update `config.hosts << "YOUR_ADDRESS"`, you can find "YOUR_ADDRESS" from the Cloud9 prompt
  * Run `rails server`
  * Click preview, and click upper right to open a new browser tab to view the app


### To deploy in production environment (local)
* Prepare rails production environment
  * Generate a secret key, `RAILS_ENV=production rake secret`
  * `export SECRET_KEY_BASE=Your-key`
  * check env var is set `echo $SECRET_KEY_BASE`
  * Add `config.secret_key_base = ENV['SECRET_KEY_BASE']` to file `config/environments/production.rb`
  
* You may want to deploy to production and test it out before pushing to Heroku
  * Create production databse `RAILS_ENV=production rake db:create`
  * `RAILS_ENV=production rake db:schema:load DISABLE_DATABASE_ENVIRONMENT_CHECK=1`
  * `RAILS_ENV=production rake db:migrate db:seed`

* set `config.public_file_server.enabled = true` in file `config/environments/production.rb`
* Run `RAILS_ENV=production rails assets:precompile`
* Start production server `RAILS_ENV=production rails s`

<br/>

* In case of other bugs, check `log/production.log` 

### To deploy in production environment (Heroku)

* Commit all your finished updates to the code, and push to the git repo 
* Prepare rails production environment as above

* Install Heroku CLI
  * `npm install -g heroku`

* Deploy to Heroku
  * Register a Heroku account
  * Log into Heroku with `heroku login -i`, enter your email
  * If multi-factor authentication is enabled, login the Heroku webpage and get the API key as password to enter in CLI
  * Create an app with `heroku create plannxt`
  * Push code to App repo on Heroku, `git push heroku main`
  * Migrate database on Heroku, `heroku run rake db:schema:load db:migrate`
  * App is deployed to Heroku, go to the website and test it out

<br/>

* In case the App is not working correctly in Heroku
  <!-- * Go to Heroku website, `reset the database`  -->
  * `heroku config:set RAILS_ENV=production`
  * then run `heroku run rake db:schema:load db:migrate` 
  * Try again, if still have issues, go to Heroku website and reset the database, then repeate tha above steps

<br/>

* Some useful Heroku commands
  * check production logs to analyze bugs `heroku logs`

---
**(Content below are from the Team Spring 2022)**

Environment:

* Ruby version - 3.1.0

* Rails version - v7.0.2.2

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Unit Test:

1 "test add a new item"
 test add a new item into the database. This could add a new item into the fixtures of database and check if it works  
2 "check data plan1 with id 1" 
 "plan1" is a sample data that already exist in the original fixtures of database. This would test the database lookup.

API:

PlanModel:

 Read: GET /plan_models_json/:id
 
 New: POST /plan_models_json
 
 Update: POST /plan_models_json/:id
 
 Delete: DELETE /plan_models_json/:id
