require 'spec_helper'

describe Chute::Client do

  before do
    @keys = Chute::Configuration::VALID_CONFIG_KEYS
  end

  describe 'with module configuration' do
    before do
      Chute.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Chute.reset
    end

    it "should inherit module configuration" do
      api = Chute::Client.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    describe 'with class configuration' do
      before do
        @config = {
            :api_endpoint => 'api',
            :auth_endpoint => 'auth',
            :upload_endpoint => "upload",
            :app_id => 'id',
            :app_secret => 'secret',
            :access_token => 'token',
        }
      end

      it 'should override module configuration' do
        api = Chute::Client.new(@config)
        @keys.each do |key|
          api.send(key).should == @config[key]
        end
      end

      it 'should override module configuration after' do
        api = Chute::Client.new

        @config.each do |key, value|
          api.send("#{key}=", value)
        end

        @keys.each do |key|
          api.send("#{key}").should == @config[key]
        end
      end

    end

  end

  describe '#as' do
    it 'should set the token for the duration of the block' do
      Chute.as 'abc' do
        Chute.access_token.should == 'abc'
      end
      Chute.access_token.should_not == 'abc'
    end
  end

  describe "client request methods" do

    [:get, :post, :put, :delete].each do |req_type|
      it "should have #{req_type} method defined" do
        Chute::Client.should respond_to req_type
      end
    end

  end

end
