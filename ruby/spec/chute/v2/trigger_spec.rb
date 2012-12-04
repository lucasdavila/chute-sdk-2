require 'spec_helper'

describe Chute::V2::Triggers do
  include_context "init credentials"

  RANDOM_POST_RESPONDING_URL = "http://www.opencalais.com/HTTPexamples"
  RANDOM_NOT_CORRECT_RESPONSE_URL = "http://www.google.com"


  after(:all) do
    VCR.insert_cassette 'triggers/triggers_cleanup', :record => :new_episodes
    # Delete all triggers for reuse
    response = Chute::V2::Triggers.all
    response.data.each do |item|
      Chute::V2::Triggers.delete(item.id)
    end
    VCR.eject_cassette
  end

  describe ".all" do
    it { Chute::V2::Triggers.should respond_to(:all).with(0).arguments }
    it { Chute::V2::Triggers.should_not respond_to(:all).with(1).arguments }
  end

  describe ".create" do
    it { Chute::V2::Triggers.should respond_to(:create).with(2).arguments }
    it { Chute::V2::Triggers.should_not respond_to(:create).with(1).arguments }
  end


  describe ".update" do
    it { Chute::V2::Triggers.should respond_to(:update).with(2).arguments }
    it { Chute::V2::Triggers.should_not respond_to(:update).with(1).arguments }
  end

  describe ".delete" do
    it { Chute::V2::Triggers.should respond_to(:delete).with(1).arguments }
    it { Chute::V2::Triggers.should_not respond_to(:delete).with(0).arguments }
  end


  describe "trigger errors" do
    before do
      VCR.insert_cassette 'triggers/trigger_errors', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should return error if event is non-existent" do
      event = 'asset_created_once'
      response = Chute::V2::Triggers.create(RANDOM_NOT_CORRECT_RESPONSE_URL, event)
      response.response.error.nil?.should == false
    end

    it "should return error if url doesn't respond to POST with 200 code" do
      response = Chute::V2::Triggers.create(RANDOM_NOT_CORRECT_RESPONSE_URL, "comment_created")
      response.response.error.nil?.should == false
    end

  end

  describe "trigger operations" do

    describe "POST create a new trigger" do

      before do
        VCR.insert_cassette 'triggers/triggers_create', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to create a new trigger" do
        response = Chute::V2::Triggers.create(RANDOM_POST_RESPONDING_URL, "asset_created")
        response.response.error.nil?.should == true
      end
    end

    describe "PUT update existing trigger" do

      before do
        VCR.insert_cassette 'triggers/triggers_update', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to create a new trigger" do
        response = Chute::V2::Triggers.create(RANDOM_POST_RESPONDING_URL, "asset_updated")
        response.pretty_print
        response.response.error.nil?.should == true
      end
    end

    describe "GET all triggers" do

      before do
        VCR.insert_cassette 'triggers/triggers_list', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should list all active triggers " do
        response = Chute::V2::Triggers.all
        response.success?.should == true
      end
    end

    describe "DELETE trigger" do

      before do
        VCR.insert_cassette 'triggers/triggers_delete', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should delete a trigger by its id " do
        response = Chute::V2::Triggers.create(RANDOM_POST_RESPONDING_URL, "asset_deleted")
        response = Chute::V2::Triggers.delete(response.data.id)
        response.success?.should == true
      end
    end
  end
end
