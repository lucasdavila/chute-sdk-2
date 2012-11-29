require 'spec_helper'

describe Chute::V2::Tags do
  include_context "init credentials"

  let(:album_id) { Chute::V2::Albums.create({:name => "Album for Tags"})}
  let(:asset_id) { Chute::V2::Assets.import('http://farm9.staticflickr.com/8194/8141607138_bfaea3afd9.jpg', nil) }

  describe ".list_asset_tags" do
    it { Chute::V2::Tags.should respond_to(:list_asset_tags).with(1).arguments }
    it { Chute::V2::Tags.should_not respond_to(:list_asset_tags).with(0).arguments }
  end

  describe ".update_asset_tags" do
    it { Chute::V2::Tags.should respond_to(:update_asset_tags).with(2).arguments }
    it { Chute::V2::Tags.should_not respond_to(:update_asset_tags).with(0).arguments }
  end

  describe ".add_asset_tags" do
    it { Chute::V2::Tags.should respond_to(:add_asset_tags).with(2).arguments }
    it { Chute::V2::Tags.should_not respond_to(:add_asset_tags).with(0).arguments }
  end

  describe ".list_album_tags" do
    it { Chute::V2::Tags.should respond_to(:list_album_tags).with(1).arguments }
    it { Chute::V2::Tags.should_not respond_to(:list_album_tags).with(0).arguments }
  end

  describe ".update_album_tags" do
    it { Chute::V2::Tags.should respond_to(:update_album_tags).with(2).arguments }
    it { Chute::V2::Tags.should_not respond_to(:update_album_tags).with(0).arguments }
  end

  describe ".add_album_tags" do
    it { Chute::V2::Tags.should respond_to(:add_album_tags).with(2).arguments }
    it { Chute::V2::Tags.should_not respond_to(:add_album_tags).with(0).arguments }
  end


  describe "album tags" do

    before do
      VCR.insert_cassette 'tags/tags_albums', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to add album tags" do
      response = Chute::V2::Tags.add_album_tags(album_id.id, {:tags => ["TAG","AnotherTag"]})
      response.success?.should == true
    end

    it "should list all album tags" do
      response = Chute::V2::Tags.list_album_tags(album_id.id)
      response.success?.should == true
    end

    it "should replace all existing album tags" do
      response = Chute::V2::Tags.update_album_tags(album_id.data.id,{:tags => ["Replaced TAG1","Replaced Tag2"]} )
      response.success?.should == true
    end

  end

  describe "asset tags" do

    before do
      VCR.insert_cassette 'tags/tags_assets', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to add asset tags" do
      response = Chute::V2::Tags.add_asset_tags(asset_id.data[0].id, {:tags => ["TAG","AnotherTag"]})
      response.success?.should == true
    end

    it "should list all asset tags" do
      response = Chute::V2::Tags.list_asset_tags(asset_id.data[0].id)
      response.success?.should == true
    end

    it "should replace all existing asset tags" do
      response = Chute::V2::Tags.update_asset_tags(asset_id.data[0].id,{:tags => ["Replaced TAG1","Replaced Tag2"]} )
      response.success?.should == true
    end

  end



end