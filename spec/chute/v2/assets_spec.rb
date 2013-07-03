require 'spec_helper'
# -*- coding: utf-8 -*-

describe Chute::V2::Assets do
  include_context "init credentials"

  describe "methods" do

    describe ".all" do
      it { Chute::V2::Assets.should respond_to(:all).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:all).with(0).arguments }
    end

    describe ".find" do
      it { Chute::V2::Assets.should respond_to(:find).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:find).with(0).arguments }
    end

    describe ".geo_locate" do
      it {  Chute::V2::Assets.should respond_to(:geo_locate).with(3).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:geo_locate).with(4).arguments }
    end

    describe ".exif" do
      it {  Chute::V2::Assets.should respond_to(:exif).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:exif).with(2).arguments }
    end

    describe ".geo" do
      it {  Chute::V2::Assets.should respond_to(:geo).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:geo).with(2).arguments }
    end

    describe ".upload" do
      it {  Chute::V2::Assets.should respond_to(:upload).with(2).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:upload).with(3).arguments }
    end

    describe ".update" do
      it {  Chute::V2::Assets.should respond_to(:update).with(2).arguments }
      it {  Chute::V2::Assets.should respond_to(:update).with(3).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:update).with(0).arguments }
    end

    describe ".delete" do
      it {  Chute::V2::Assets.should respond_to(:delete).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:delete).with(2).arguments }
    end

  end

  describe "requests" do

    before do
      @asset_urls = ['http://www.wix.com/blog/wp-content/uploads/2012/08/HowToGoBeyondStockPhotoCliches.jpg',
                     'http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2012/11/27/1354010019306/Brad-Pitt-010.jpg',
                     'http://datastore01.rediff.com/h1500-w1500/thumb/52605E5F6D6C65665C60665C696C7371/fuugfaw7icy0hq4j.D.0.Richa-Gangopadhyay-Latest-Hot-Photo.jpg'
      ]
    end
    let(:list_assets) { Chute::V2::Assets.all(2327121) } # Test album id

    describe "GET Assets List" do
      before do
        VCR.insert_cassette 'assets/assets_list', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end



      it "should be able to list all assets in an album" do
        response = list_assets
        response.data.should_not == nil
      end
    end

    describe "POST Asset Import" do

      before do
        VCR.insert_cassette 'assets/assets_import', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to import assets from urls" do
        response = Chute::V2::Assets.import(@asset_urls,nil)
        response.data.map { |a| @asset_urls.include?(a.source.source_url).should==true }
      end

    end

    describe "GET Asset by ID" do
      before do
        VCR.insert_cassette 'assets/assets_get', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should retrieve asset by its id" do
        response = Chute::V2::Assets.import(@asset_urls[0],nil)
        id = response.data[0].id
        response = Chute::V2::Assets.find(id)
        response.data.id.should == id
      end
    end

    describe "PUT Asset Update" do

      before do
        VCR.insert_cassette 'assets/assets_update', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to update an assets title" do
        response = Chute::V2::Assets.import(@asset_urls[0],nil)
        caption = "New Asset Title"
        response = Chute::V2::Assets.update(response.data[0].id, :caption => caption)
        response.data.caption.should == caption
      end
    end

    describe "DELETE Asset" do

      before do
        @asset_url = 'http://image.coloring.com/pictures/overlay/cat-and-fancy-mouse.gif'
        VCR.insert_cassette 'assets/assets_delete', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to delete an asset" do
        response = Chute::V2::Assets.import(@asset_url,nil)
        response = Chute::V2::Assets.delete(response.data[0].id)
        response.success?.should == true
      end
    end

    describe "GET geo for asset" do

      let(:import_assets) { Chute::V2::Assets.import(@asset_urls,nil) }

      before do
        VCR.insert_cassette 'assets/assets_geo', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should fetch geo info for asset" do
        response = import_assets
        response = Chute::V2::Assets.geo(response.data[0].id)
        response.data.should_not == nil
      end

      it "should be able to find near location with radius" do
        response = import_assets
        response = Chute::V2::Assets.geo_locate("-36.88155833","174.70791111", 500)
        response.data.should_not == nil
      end

    end

  end

  describe "POST file upload" do
    include_context "test files"

    before do
      VCR.insert_cassette 'assets/assets_upload', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should have a sample file to test uploads with" do
      File.exist?(test_image_path).should == true
    end

    it "should be able to upload image inside an album" do
      f = File.new(test_image_path)
      response = Chute::V2::Assets.upload("2443331", f)
      response.success?.should == true
    end
  end
end
