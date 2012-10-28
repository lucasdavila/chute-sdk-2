CHUTE WRAPPER GEM
==

Development
==

to build and install the gem locally on your system use:

rake install

you can afterwards include it inside your rails app

Running tests
==

to run the tests write bundle exec rspec

Configuration of the Gem Inside your Rails Project
==

Chute.config do |config|
  config.app_id = YOUR_APP_ID
  config.app_secret = YOUR_APP_SECRET
  config.access_token = YOUR_ACCESS_TOKEN
end


