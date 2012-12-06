require 'spec_helper'

describe Chute::V2::Votes do
  include_context "init credentials"

  let(:album_id) do
    Chute::V2::Albums.create({:name => "Album for Votes"}).data.id
  end

  let(:asset_id) do
    Chute::V2::Albums.import(album_id,'http://sphotos-f.ak.fbcdn.net/hphotos-ak-snc6/6393_451942991531262_1464781412_n.jpg').data[0].id
  end

  describe ".all" do
    it { Chute::V2::Votes.should respond_to(:count).with(2).arguments }
    it { Chute::V2::Votes.should_not respond_to(:count).with(1).arguments }
  end

  describe ".create" do
    it { Chute::V2::Votes.should respond_to(:vote).with(2).arguments }
    it { Chute::V2::Votes.should_not respond_to(:vote).with(1).arguments }
  end

  describe ".delete" do
    it { Chute::V2::Votes.should respond_to(:remove_vote).with(2).arguments }
    it { Chute::V2::Votes.should_not respond_to(:remove_vote).with(1).arguments }
  end


  describe "heart methods" do

    before do
      VCR.insert_cassette 'votes/votes_methods', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to vote an asset" do
      response = Chute::V2::Votes.vote(album_id,asset_id)
      response.success?.should == true
    end

    it "should be able list all votes" do
      response = Chute::V2::Votes.count(album_id,asset_id)
      response.success?.should == true
    end

    it "should be able remove a vote" do
      response = Chute::V2::Votes.vote(album_id,asset_id)
      response = Chute::V2::Votes.remove_vote(album_id,asset_id)
      response.success?.should == true
    end

  end
end
