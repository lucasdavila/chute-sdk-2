require 'spec_helper'

describe Chute::V2::Campaigns do
  include_context "init credentials"


  describe "methods" do

    describe ".all" do
      it { Chute::V2::Campaigns.should respond_to(:all).with(0).arguments }
      it { Chute::V2::Campaigns.should respond_to(:all).with(1).arguments }
      it { Chute::V2::Campaigns.should respond_to(:all).with(2).arguments }
    end

    describe ".find" do
      it { Chute::V2::Campaigns.should respond_to(:find).with(1).arguments }
      it { Chute::V2::Campaigns.should_not respond_to(:find).with(0).arguments }
    end

    describe ".create" do
      it { Chute::V2::Campaigns.should respond_to(:create).with(1).arguments }
      it { Chute::V2::Campaigns.should_not respond_to(:create).with(2).arguments }
    end

  end

  describe "requests" do
    describe "GET Campaign List" do
      before do
        VCR.insert_cassette 'campaigns/campaigns', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to list all campaigns" do
        response = Chute::V2::Campaigns.all
        response.data.should_not == nil
      end
    end

    describe "POST Campaign Create" do
      it "should be able to create a campaign" do
        VCR.insert_cassette 'campaigns/campaigns_create', :record => :new_episodes
        campaign = Hash.new
        campaign[:name] = "some campaign #{Time.now.to_s}"
        response = Chute::V2::Campaigns.create(campaign)
        VCR.eject_cassette
      end
    end

    describe "GET Campaign by ID" do
      before do
        VCR.insert_cassette 'campaigns/campaign_get', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should retrieve campaign by its id" do
        id = Chute::V2::Campaigns.create({:name => "Created Campaign"}).data.id
        response = Chute::V2::Campaigns.find(id)
        response.data.id.should == id
      end
    end

  end

end
