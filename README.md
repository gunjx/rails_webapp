# README

A Rails e-commerce web app with a responsive layout. The website was created as a learning exercise of career foundry's web development online course. The course teaches hands-on web development skills that are relevant in the job market. More information at: https://careerfoundry.com/en/course/become-a-web-developer/course-plan.

A hosted work-in-progress e-commerce shop can be found here:
https://hipsterfood.herokuapp.com/.

## Features

The app offers users the possibility to find and order products.

Features include:
* Responsive, i.e. fits mobile and desktop screens.
* Product overview page and search box to find products
* Sign up and sign in
* User roles and access
* Automated emails on e.g. sign up
* Product ratings with comments updated in real-time and without page reload
* Credit card payment
* Order history
* Contact page

## Installation & Usage

### Install Ruby on Rails
To simply install Ruby language and Rails the following installation guide is very helpful: http://installrails.com/Install (only the relevant parts). The guide recommends rvm for the installation. The Ruby and Rails versions used for this web app are Ruby 2.5.0 and Rails 5.1.6 respectively.

You can check a successful Ruby on Rails installation by typing:

```
rails new nameofapp -T
cd nameofapp
rails server
```

You should see the rails welcome page in your browser under the address localhost:3000.

### Dependencies
The rails web shop makes use of several ruby gems such as jquery. The list of gems can be found under Gemfile. To install all gems simply run ```bundle install```.

### Database
The app is configured to use SQLite3 in development and PostgreSQL in production for easy heroku deployment. If you wish to use a different database type, change the Gemfile accordingly.

Four database models are defined: User, Product, Order, Comment. I recommend to pre-populate the products database with at least 4 seed entries to ensure full site functionality (e.g. the featured page). Add entries under db/seeds.rb and execute ```rails db:seed```. Alternatively add db entries via the rails console:

```
rails console
Product.create(name: "yourProductName", description: "yourProductDescription", image_url: "yourProductUrl", price: "yourProductPrice")
```

Add more database columns if necessary:

```
rails generate migration add_feature_to_dbname columnName: datatype
```

Migrate the database when finished with ```rails db:migrate```.

Standard database columns for the products, users, orders and comments have been created under db/migrate.

### Configuration
To add admin rights to a user, change the admin property in the rails console:

```
User.all
u = User.find(id)
(or u = User.first in case it is the first created user)
u.admin = true
u.save
u.admin?
```

Alternatively, populate the user database with a seed entry including the admin rights. You can hide buttons in the views by checking a user's admin status. Moreover, you can edit admin permissions in app/models/ability.rb.

Contact form emails are activated by default. Insert your email address in the contact_form method app/mailers/user_mailer.rb.
If you want to send the user automated welcome emails, I recommend heroku's sendgrid plugin. Enable ActionMailer to use SendGrid in config/environment.rb (already enabled). Change default "from" email in app/mailers/application_mailer.rb and app/mailers/user_mailer.rb. You can change the standard email templates under app/views/user_mailer.

The web shop is set to use payment via stripe. Here is a quickstart guide: https://stripe.com/docs/development. Add your test keys from your stripe account to config/initizalizers/stripe.rb and your production keys to heroku's environment variables.  Test your application with the following test cards: 4242 4242 4242 4242 (Visa) or 5555 5555 5555 4444	(Mastercard).

### Testing
Run tests with ```rspec```. Run ```rspec spec/models``` or ```rspec spec/controllers``` to only run unit tests or functional tests respectively.

### Deployment instruction
The rails app can be deployed for free using heroku's free plan. To get started, follow the instructions here: https://devcenter.heroku.com/articles/getting-started-with-rails5. In case you don't want to use heroku, you can deploy your e-commerce site using a custom domain with one of many cloud platforms (Amazon S3, Microsoft Azure, Google Cloud).

## Learning Goal
This project helped me getting familiar with:
* Client/server model and the backend architecture of an e-commerce site
* MVC architecture and scaffolding
* Database architecture, including associations for models
* Accessing and controlling the database via terminal
* Database migrations
* Writing embedded ruby into html content
* DRY with rendering partials
* CRUD actions, RESTful Routing, URL requests, redirects and dynamic links
* Automated emails in development and production
* Authentication, Sessions and password encryption
* Authorization, user abilities, admin users
* TDD vs BDD, unit and functional testing with RSpec and FactoryBot
* Payment with Stripe API
* Debugging with byebug
* AJAX requests
* Caching with Memcached and Redis
* Streaming and broadcasting real-time updates with ActionCable

## TODO
* Hide admin buttons (e.g. "new product") from non-admins in views
* Force user to use better passwords
* Force user to confirm email address
* Implement shopping cart
* Add "add to shopping cart"-button in product view
* Enhance shopping UX in general
* Style error messages (e.g. "email has already been taken")
* Style order history
* Style payment form or create checkout page
* Style "forgot password?"-page
* Fix error for password reset
* Add autocomplete to product search
* Create user settings page
* Expand and style user welcome email
* Increase test coverage
