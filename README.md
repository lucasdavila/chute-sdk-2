CHUTE WRAPPER GEM
==

Development
--

to build and install the gem locally on your system use:

        rake install

you can afterwards include it inside your rails app


Running tests
--

to run the tests write


        bundle exec rspec

to be able to run the test you need to create an authorization file with the following contents
place it inside spec/support/authorization.rb

get the credentials for this from apps.getchute.com because it will hit production

shared_context "init credentials" do

  before(:all) do
    Chute.app_id = "508fc620018d162a070000d6"
    Chute.app_secret = "2ee285c24d8ffa83145aba8834f29ca1644b293a76a49db59a037e7301a26119"
    Chute.access_token = "fe5d08d828c1d4562e5d2a7bbbb76e7dfa1fbc0932467a7a710bec66935df654"
  end

end


Configuration of the Gem Inside your config/ folder


--

```
Chute.configure do |config|
  config.app_id = YOUR_APP_ID
  config.app_secret = YOUR_APP_SECRET
  config.access_token = YOUR_ACCESS_TOKEN
end
```


The parameters in the response are accessed as standard fields inside a class. Assuming `response` is the basic
object containing the complete response you can access the id of the element by

```
response.data.id # if data is a single object
response.data[0].id # if data is an array
```


Responses are being recorded for reuse by using VCR

if you need to re-run some of them remove the specific one from `fixtures/`
