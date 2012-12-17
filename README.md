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


Configuration of the Gem Inside your config/ folder
--

```
Chute.config do |config|
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
