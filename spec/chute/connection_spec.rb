require 'spec_helper'

describe Chute::Connection do
  describe "methods" do
    it "must include httparty methods" do
      Chute::Connection.should include HTTParty
    end
    it "must have the base url set to the Chute API endpoint" do
      Chute::Connection.base_uri.should == Chute.api_endpoint
    end

    describe ".request" do
      it { Chute::Connection.should respond_to(:request).with(2).arguments }
      it { Chute::Connection.should respond_to(:request).with(3).arguments }
      it { Chute::Connection.should_not respond_to(:request).with(0).arguments}
    end

  end

  describe "headers" do

    it "must have the Authorization header" do
      Chute::Connection.headers.has_key?("Authorization").should == true
    end

    it "must have Authorization set to Access Token value" do
      Chute::Connection.headers["Authorization"].should == "OAuth #{Chute.access_token}"
    end

    it "must have the Content-Type header" do
      Chute::Connection.headers.has_key?("Content-Type").should == true
    end

    it "must have the Accepts header" do
      Chute::Connection.headers.has_key?("Accepts").should == true
    end

    ["Content-Type", "Accepts"].each do |key|
      it "must have header #{key} set to application/json" do
        Chute::Connection.headers[key].should == "application/json"
      end
    end

  end


end
