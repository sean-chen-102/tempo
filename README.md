# Tempo README
---

## 1. Heroku
To view this application, please go to: https://tempo169.herokuapp.com/

**Note:** if the app doesn't display properly on Heroku for you, you properly have an outdated cookie stored in your browser. Please clear your cookies for this site and revist the website again. Viewing the website in incognito mode will not clear the cookie.


## 2. Local Server
To run it locally, have Ruby on Rails installed with Ruby version 2.2.0 and Rails version 4.2.4. Run `rails s` in the terminal at the folder in which tempo is located. This will run the application on localhost:3000.

Upon first install, you will need to set up the database before any data can be displayed in the app. This can be done by running:

```
rake db:create
rake db:setup
rake db:migrate
rake db:reset
```


## 3. Tests
To run all of the functional and unit tests on the back end, run: `bundle exec rspec`
	
After running these tests, you will also be able to see our code coverage percentage in the terminal. If you'd like to see a visualization of our code coverage, open up the folder in tempo/coverage and open the file index.html in a web browser. Our code coverage should be around ~99.82%. Alternatively, you can view our live code coverage on GitHub at: https://github.com/tempo169/tempo/blob/master/coverage/index.html

You can also run some model-only unit tests on the back end through the command: `rake test:models`

To run the front end tests over the Backbone.js framework, run the command: `bundle exec teaspoon --coverage=default`

**Note**: some Backbone.js tests will fail due to conflicts with Sinon, Teaspoon, and Backbone.js. However, you will
still be able to see our code coverage for this part. Backbone.js tests are insignificant, as we run automated UI testing through Capybara and the Capybara-Webkit driver (these are included when running `bundle exec rspec`).


## 4. Troubleshooting
If database-related things aren't working as they should, try:
```
rake db:drop
rake db:create
rake db:migrate
rake db:reset
```

If visually-related things aren't working as they should or aren't refreshing, try:
```
rake assets:clean
rake assets:precompile
```

If you are getting an error related to 'qt', 'capybara', 'capybara-webkit', or 'bundle install', you probably don't have the correct applications installed on your local machine required to run our app with Capybara (this only applies for test and development environments). In that case, you need to install qt version 5+. Some brief steps you can take to do this are:
	
1. Run `bundle install` with capybara-webkit in the gemfile. Alternatively, run: `gem install capybara-webkit` - if this errors, see #2
2. Make sure you have qt version 5+ installed on your local machine. On OSX, you can install qt with: `brew install qt5`
  * If you have a conflict with qt version 4, you will need to remove version 4 and reinstall version 5+
3. Make sure you have linked qt via Homebrew: `brew link --force qt5`
  * If you don't have permission to do this, try: `sudo chown -R $USER /usr/local` and run the linking command at #3 again
  * Then run: `which qmake` which should return `/usr/local/bin/qmake`. If not, please consult Google/Stack Overflow for qt installation help
4. Run `bundle install` again - this should succeed without errors.

