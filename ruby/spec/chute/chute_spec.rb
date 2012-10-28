require_relative '../../spec/spec_helper'

describe Chute do

  # test/awesome/configuration_test.rbrequire 'helper'

  describe 'configuration' do

    describe '.api_endpoint' do
      it 'should return default api_endpoint' do
        Chute.api_endpoint.should == Chute::Configuration::DEFAULT_API_ENDPOINT
      end
    end

    describe '.auth_endpoint' do
      it 'should return default auth_endpoint' do
        Chute.auth_endpoint.should == Chute::Configuration::DEFAULT_AUTH_ENDPOINT
      end
    end

    describe '.app_id' do
      it 'should return default app_id' do
        Chute.app_id.should == Chute::Configuration::DEFAULT_APP_ID
      end
    end

    describe '.app_secret' do
      it 'should return default app_secret' do
        Chute.app_secret.should == Chute::Configuration::DEFAULT_APP_SECRET
      end
    end

    describe '.access_token' do
      it 'should return default access_token' do
        Chute.access_token.should == Chute::Configuration::DEFAULT_ACCESS_TOKEN
      end
    end

    after do
      Awesome.reset
    end

    describe '.config' do
      Chute::Configuration::VALID_CONFIG_KEYS.each do |key|
        it "should set the #{key}" do
          Chute.config do |config|
            config.send("#{key}=", key)
            Chute.send(key).should == key
          end
        end
      end
    end
  end
end
