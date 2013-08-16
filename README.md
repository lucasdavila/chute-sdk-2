![Status](https://circleci.com/gh/chute/chute-sdk-2.png?circle-token=:circle-token)

# Chute API V2 wrapper gem

> Access [Chute API V2](https://api.getchute.com/v2) from Ruby.


## How to use

Install directly

```sh
gem install chute
```

or add to your Gemfile

```ruby
gem 'chute'
```


### Configuration

Create `config/initializers/chute.rb` and set your credentials (you can get them from [apps.getchute.com](http://apps.getchute.com).

```ruby
Chute.configure do |config|
  config.app_id = YOUR_APP_ID
  config.app_secret = YOUR_APP_SECRET
  config.access_token = YOUR_ACCESS_TOKEN
end
```


### Usage

The parameters in the response are accessed as standard fields inside a class. Assuming `response` is the basic
object containing the complete response you can access the id of an element by

```ruby
response.data.id # if data is a single object
response.data[0].id # if data is an array
```


## Development

To build and install the gem locally on your system use:

    rake install

you can afterwards include it inside your rails app


### Tests

To be able to run tests you'll first need to create an authorization file with the following contents and save it as `spec/support/authorization.rb`

```ruby
shared_context "init credentials" do
  before(:all) do
    Chute.app_id = "508fc620018d162a070000d6"  # this is an app designated for API testing
    Chute.app_secret = "2ee285c24d8ffa83145aba8834f29ca1644b293a76a49db59a037e7301a26119"
    Chute.access_token = "fe5d08d828c1d4562e5d2a7bbbb76e7dfa1fbc0932467a7a710bec66935df654"
  end
end
```

Now you can run tests using rspec

    bundle exec rspec


Responses are recorded for reuse by VCR. If you need to re-run some of them remove the specific file from `spec/fixtures/`


## License

Copyright (c) 2012-2013 Chute Corporation. Released under the MIT License.
