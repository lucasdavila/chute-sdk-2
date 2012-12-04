require 'spec_helper'

describe Chute::V2::Tags do
  include_context "init credentials"

  let(:album_id) do
     Chute::V2::Albums.create({:name => "Album for Tags"}).data.id
  end

  let(:asset_id) do
    Chute::V2::Albums.import(album_id,'http://farm9.staticflickr.com/8194/8141607138_bfaea3afd9.jpg').data[0].id
  end

  describe ".all_asset_tags" do
    it { Chute::V2::Tags.should respond_to(:all_asset_tags).with(2).arguments }
    it { Chute::V2::Tags.should_not respond_to(:all_asset_tags).with(1).arguments }
  end

  describe ".update_asset_tags" do
    it { Chute::V2::Tags.should respond_to(:update_asset_tags).with(3).arguments }
    it { Chute::V2::Tags.should_not respond_to(:update_asset_tags).with(0).arguments }
  end

  describe ".add_asset_tags" do
    it { Chute::V2::Tags.should respond_to(:add_asset_tags).with(3).arguments }
    it { Chute::V2::Tags.should_not respond_to(:add_asset_tags).with(0).arguments }
  end

  describe "asset tags" do

    before do
      VCR.insert_cassette 'tags/tags_assets', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to add asset tags" do
      response = Chute::V2::Tags.add_asset_tags(album_id,asset_id,"TAG","AnotherTag")
      response.success?.should == true
    end

    it "should list all asset tags" do
      response = Chute::V2::Tags.all_asset_tags(album_id,asset_id)
      response.success?.should == true
    end

    it "should replace all existing asset tags" do
      response = Chute::V2::Tags.update_asset_tags(album_id,asset_id,"Replaced TAG1","Replaced Tag2" )
      response.success?.should == true
    end

  end

  describe ".process_array" do

    it "should be able to produce a single flat array of unique tags" do
      Chute::V2::Tags.send(:process_array, ["TAG", "AnotherTag", ["TAG", "AnotherTag"]]).should == ["TAG", "AnotherTag"]
    end

    it "should not remain unmodified" do
      Chute::V2::Tags.send(:process_array, ["TAG", "AnotherTag", ["TAG", "AnotherTag"]]).should_not == ["TAG", "AnotherTag", ["TAG", "AnotherTag"]]
    end

    it "should not modify the array if its simple" do
      Chute::V2::Tags.send(:process_array, ["TAG", "AnotherTag"]).should == ["TAG", "AnotherTag"]
    end

  end



end