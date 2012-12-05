require 'spec_helper'

describe Chute::V2::Comments do
  include_context "init credentials"

  let(:album_id) do
    Chute::V2::Albums.create({:name => "Album for Hearts"}).data.id
  end

  let(:asset_id) do
    Chute::V2::Albums.import(album_id,'http://sphotos-f.ak.fbcdn.net/hphotos-ak-snc6/6393_451942991531262_1464781412_n.jpg').data[0].id
  end

  describe ".all" do
    it { Chute::V2::Hearts.should respond_to(:count).with(2).arguments }
    it { Chute::V2::Hearts.should_not respond_to(:count).with(1).arguments }
  end

  describe ".create" do
    it { Chute::V2::Hearts.should respond_to(:heart).with(2).arguments }
    it { Chute::V2::Hearts.should_not respond_to(:heart).with(1).arguments }
  end

  describe ".delete" do
    it { Chute::V2::Hearts.should respond_to(:unheart).with(3).arguments }
    it { Chute::V2::Hearts.should_not respond_to(:unheart).with(2).arguments }
  end


  describe "heart methods" do

    before do
      VCR.insert_cassette 'hearts/hearts_methods', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to heart an asset" do
      response = Chute::V2::Hearts.heart(album_id,asset_id)
      response.success?.should == true
    end

    it "should be able list all hearts" do
      response = Chute::V2::Hearts.count(album_id,asset_id)
      response.success?.should == true
    end

    it "should be able delete a heart" do
      pending "Not deployed"
      response = Chute::V2::Hearts.heart(album_id,asset_id)
      response = Chute::V2::Hearts.unheart(album_id,asset_id,response.data.id)
      response.success?.should == true
    end

  end
end
