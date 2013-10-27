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


