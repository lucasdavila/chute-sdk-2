require 'spec_helper'

describe Chute::V2::Albums do
  include_context "init credentials"


  describe "methods" do

    describe ".all" do
      it { Chute::V2::Albums.should respond_to(:all).with(0).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:all).with(1).arguments }
    end
    
    describe ".find" do
      it { Chute::V2::Albums.should respond_to(:find).with(1).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:find).with(0).arguments }
    end

    describe ".geo_search" do
      it {  Chute::V2::Albums.should respond_to(:geo_search).with(4).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:geo_search).with(5).arguments }
    end

    describe ".assets" do
      it {  Chute::V2::Albums.should respond_to(:assets).with(3).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:assets).with(4).arguments }
    end

    describe ".import" do
      it {  Chute::V2::Albums.should respond_to(:import).with(2).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:import).with(3).arguments }
    end

    describe ".create" do
      it {  Chute::V2::Albums.should respond_to(:create).with(1).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:create).with(2).arguments }
    end

    describe ".update" do
      it {  Chute::V2::Albums.should respond_to(:update).with(2).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:update).with(3).arguments }
    end

    describe ".delete" do
      it {  Chute::V2::Albums.should respond_to(:delete).with(1).arguments }
      it {  Chute::V2::Albums.should_not respond_to(:delete).with(2).arguments }
    end

  end

  describe "GET Album List" do
    before do
      VCR.insert_cassette 'albums/albums_list', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to list all albums" do
      puts Chute::V2::Albums.all.to_yaml
    end

  end

  describe "POST Album Create" do
    before do
      VCR.insert_cassette 'albums/albums_create', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to create an album" do
      album = Hash.new
      album[:name] = "some album #{Time.now.to_s}"
      album[:moderate_comments] = true
      puts Chute::V2::Albums.create(album).to_yaml
    end
  end
  
  
end
