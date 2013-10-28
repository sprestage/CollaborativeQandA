Collaborative Q & A
=======

A collaborative question-and-answer site. Allows users to register and sign in. Allows users to view all questions and answers in the site, and edit field they like (eg: no authorization restrictions needed).

Each question only needs one answer, so you can use a single Question resource (that has an answer attribute, rather than associating with answer resource). Scaffolding is used.

However, the app should track all the questions/answers that have been edited by a given user. Since one user can edit many different questions, and any given question can be edited by many/any users, use a has_and_belongs_to_many (aka: habtm) association.

Basic Install
=======
Clone this git repository.
  > clone http://github.com/sprestage/CollaborativeQandA.git

Run the rails server
  > rails s

Use browser to access your questions and answers at http://localhost:3000  Better to run this publicly so you can collaborate with others.  :)

Implementation
=======
This is a simple rails app, with a pair of nested resources, Lists and Items.  Each list has many items.  Each item belongs to one list.

  > rails _3.2.15_ new CollaborativeQandA --skip-test-unit

  > cd CollaborativeQandA

Edit Gemfile for some useful debugging gems

  > bundle

Tuck away RAILS_SECRET from /config/initializer/secret_token.rb to /config/application.yml and add /config/application.yml to .gitignore.

Ok, now we create the scaffold for the new resource, User.

  > rails g scaffold collaboration --no-test-framework --no-assets --no-stylesheets --no-scss question:text answer:text

Somehow, the above doesn't successfully create the name column, so I generated an additional migration to add the list name.

  > rails generate migration AddDetailsToCollaborations question:text answer:text
  > rake db:migrate

Alternately, I should probably create all the tests first, but I feel so lost without the stuff there first, ya know.

Create the tests, starting with show index of lists, show single list, and create list.  I played with this to create the files,
then I completely replaced what was in the files.
  > rails g mini_test:feature CollaborationShowIndex
  > rails g mini_test:feature CollaborationShow
  > rails g mini_test:feature CollaborationCreate
  > rails g mini_test:feature CollaborationUpate
  > rails g mini_test:feature CollaborationDelete

Ok, now time to run the tests.

First, some quick BDD sanity checking.  Let's fire up the server and see what we can learn.

  > rails s

Hmm, no route to /.  Add the root route 'root :to => 'home#index' to /config/routes.rb

Ok, what next.  Keep browsing.  Ahhhh.  Home controller is missing.  I remain confused why this isn't created with the initial rails install, but there you go.  Ok, create a /app/controllers/home_controller.rb.  Add a stub for index:

  class HomeController < ApplicationController
    def index
    end
  end

All the browsing seems in order now.  Time to get the tests running.

Also, need a /app/views/home/ folder and an /app/views/home/index.html.erb file since I deleted the one in /public right after creating the default rails app.  :)

Don't forget to add fixture support to the /test/minitest_helper.rb file!  And the other stuff!

Also remember to add to the rakefile: MiniTest::Rails::Testing.default_tasks << 'features'

Update the /app/views/collaborations/*.html.erb
Update the /app/models/collaboration.rb

Ok, all the collaboration stuff works.  Time to implement users, sign-in, sign-up, sign-out.

Use devise.

Add to Gemfile:
  gem 'devise'
  gem 'omniauth'
  gem 'bcrypt-ruby'

Run bundle.
  > bundle

Do the devise generates.  First generate the initializer to describe all devise config options.

  > rails generate devise:install

Now, generate the devise model
  > rails generate devise User

Check the migration created.  Also check the user.rb file.  Then migrate.
  > rake db:migrate

This will be needed to configure the views.
  > rails generate devise:views

Ok, done with Users and Collaborations.  Check in and move on to has_and_belongs_to_many.

Much later and I've tried very hard and failed to implement has_and_belongs_to_many.  It may be that there is just a little more to learn.  But once I've figured out the controller (Create and Update Collaborations has defeated me), then I'll still need to update the views and the tests, so I feel like I'm a long way off.  Submitting now so I can get help and also move on to the next thing to learn.  Beware, tests are broken at this time.  -sprestage 10/27/13
