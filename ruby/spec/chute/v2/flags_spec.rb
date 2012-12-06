require 'spec_helper'

describe Chute::V2::Flags do
  include_context "init credentials"

  let(:album_id) do
    Chute::V2::Albums.create({:name => "Album for Flags"}).data.id
  end

  let(:asset_id) do
    Chute::V2::Albums.import(album_id,'http://sphotos-f.ak.fbcdn.net/hphotos-ak-snc6/6393_451942991531262_1464781412_n.jpg').data[0].id
  end

  describe ".all" do
    it { Chute::V2::Flags.should respond_to(:count).with(2).arguments }
    it { Chute::V2::Flags.should_not respond_to(:count).with(1).arguments }
  end

  describe ".create" do
    it { Chute::V2::Flags.should respond_to(:flag).with(2).arguments }
    it { Chute::V2::Flags.should_not respond_to(:flag).with(1).arguments }
  end

  describe ".delete" do
    it { Chute::V2::Flags.should respond_to(:unflag).with(3).arguments }
    it { Chute::V2::Flags.should_not respond_to(:unflag).with(2).arguments }
  end


  describe "flag methods" do

    before do
      VCR.insert_cassette 'flags/flags_methods', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to flag an asset" do
      response = Chute::V2::Flags.flag(album_id,asset_id)
      response.success?.should == true
    end

    it "should be able list all flags" do
      response = Chute::V2::Flags.count(album_id,asset_id)
      response.success?.should == true
    end

    it "should be able delete a flag" do
      pending "Not Working"
      response = Chute::V2::Flags.flag(album_id,asset_id)
      response = Chute::V2::Flags.unflag(album_id,asset_id,response.data.id)
      response.success?.should == true
    end

  end
end
