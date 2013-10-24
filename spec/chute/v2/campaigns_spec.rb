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

    describe "storage endpoints" do
      before do
        VCR.insert_cassette 'campaigns/storage', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      let(:id) { Chute::V2::Campaigns.create({:name => "Created Campaign"}).data.id }

      [:temp, :private, :public].each do |storage_type|
        it "Test #{storage_type} storage flow" do
          response = Chute::V2::Campaigns.send("#{storage_type}_storage_create", id, {a: "b"})
          @id = response.data.id
          response.data.should_not == nil
        end

        it "GET #{storage_type} storage" do
          response = Chute::V2::Campaigns.send("#{storage_type}_storage_create", id, {a: "b"})
          @id = response.data.id
          response = Chute::V2::Campaigns.send("#{storage_type}_storage_find", id, @id)
          response.data.id.should == @id
        end

        it "PUT #{storage_type} storage" do
          response = Chute::V2::Campaigns.send("#{storage_type}_storage_create", id, {a: "b"})
          @id = response.data.id
          response = Chute::V2::Campaigns.send("#{storage_type}_storage_update", id, @id, {b: "c"})
          JSON.parse(response.data.value).should == {"b" => "c"}
        end
      end
    end

  end

end
