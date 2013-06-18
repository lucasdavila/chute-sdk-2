require 'spec_helper'

describe Chute::V2::Albums do
  include_context "init credentials"


  describe "methods" do

    describe ".all" do
      it { Chute::V2::Albums.should respond_to(:all).with(0).arguments }
      it { Chute::V2::Albums.should respond_to(:all).with(1).arguments }
      it { Chute::V2::Albums.should respond_to(:all).with(2).arguments }
    end

    describe ".find" do
      it { Chute::V2::Albums.should respond_to(:find).with(1).arguments }
      it { Chute::V2::Albums.should_not respond_to(:find).with(0).arguments }
    end

    describe ".geo_locate" do
      it { Chute::V2::Albums.should respond_to(:geo_locate).with(4).arguments }
      it { Chute::V2::Albums.should_not respond_to(:geo_locate).with(5).arguments }
    end

    describe ".assets" do
      it { Chute::V2::Albums.should respond_to(:assets).with(3).arguments }
      it { Chute::V2::Albums.should_not respond_to(:assets).with(4).arguments }
    end

    describe ".import" do
      it { Chute::V2::Albums.should respond_to(:import).with(2).arguments }
      it { Chute::V2::Albums.should_not respond_to(:import).with(0).arguments }
    end

    describe ".create" do
      it { Chute::V2::Albums.should respond_to(:create).with(1).arguments }
      it { Chute::V2::Albums.should_not respond_to(:create).with(2).arguments }
    end

    describe ".update" do
      it { Chute::V2::Albums.should respond_to(:update).with(2).arguments }
      it { Chute::V2::Albums.should_not respond_to(:update).with(0).arguments }
    end

    describe ".delete" do
      it { Chute::V2::Albums.should respond_to(:delete).with(1).arguments }
      it { Chute::V2::Albums.should_not respond_to(:delete).with(2).arguments }
    end

    describe ".stats" do
      it { Chute::V2::Albums.should respond_to(:stats).with(1).arguments }
      it { Chute::V2::Albums.should_not respond_to(:stats).with(0).arguments }
    end

    describe ".add_assets" do
      it { Chute::V2::Albums.should respond_to(:add_assets).with(2).arguments }
      it { Chute::V2::Albums.should_not respond_to(:add_assets).with(0).arguments }
    end
    describe ".remove_assets" do
      it { Chute::V2::Albums.should respond_to(:remove_assets).with(2).arguments }
      it { Chute::V2::Albums.should_not respond_to(:remove_assets).with(0).arguments }
    end

  end

  describe "requests" do
    describe "GET Album List" do
      before do
        VCR.insert_cassette 'albums/albums_list', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to list all albums" do
        response = Chute::V2::Albums.all
        response.data.should_not == nil

      end

      it "should contain pagination" do
        response = Chute::V2::Albums.all
        response.pagination.should_not ==nil
      end

    end

    describe "POST Album Create" do
      it "should be able to create an album" do
        VCR.insert_cassette 'albums/albums_create', :record => :new_episodes
        album = Hash.new
        album[:name] = "some album #{Time.now.to_s}"
        album[:moderate_comments] = true
        response = Chute::V2::Albums.create(album)
        VCR.eject_cassette
      end

      it 'should respect permission_view' do
        VCR.insert_cassette 'albums/album_create_with_permission_view', :record => :new_episodes
        album = Hash.new
        album[:name] = "some new album #{Time.now.to_s}"
        album[:permission_view] = 2
        response = Chute::V2::Albums.create(album)
        VCR.eject_cassette
      end
    end

    describe "GET Album by ID" do
      before do
        VCR.insert_cassette 'albums/albums_get', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should retrieve album by its id" do
        id = Chute::V2::Albums.create({:name => "Created Album"}).data.id
        response = Chute::V2::Albums.find(id)
        response.data.id.should == id
      end
    end

    describe "PUT Album Update" do

      before do
        VCR.insert_cassette 'albums/albums_update', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to update an album" do
        response = Chute::V2::Albums.create({:name => "Created Album"})
        name = "Updated Album"
        response = Chute::V2::Albums.update(response.data.id, {:name => name})
        response.data.name.should == name
      end
    end

    describe "DELETE Album" do

      before do
        VCR.insert_cassette 'albums/albums_delete', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to delete an album" do
        response = Chute::V2::Albums.create({:name => "Created Album"})
        response = Chute::V2::Albums.delete(response.data.id)
        response.success?.should == true
      end
    end

    describe "GET Album Stats" do
      before do
        VCR.insert_cassette 'albums/albums_stats', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should retrieve stats" do
        response = Chute::V2::Albums.create({:name => "Created Album"})
        response = Chute::V2::Albums.stats(response.data.id)
      end
    end

    describe "POST add and remove Assets" do

      let(:id) { Chute::V2::Albums.create({:name => "Created Album"}).data.id }
      let(:asset_ids) { [4342325, 4342324, 534543] }  # Non Existing assets (random)

      before do
        VCR.insert_cassette 'albums/albums_add_remove_assets', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to add existing assets to existing album" do
        response = Chute::V2::Albums.add_assets(id, [71907823])
        response.should be_true
      end


      it "should be able to remove existing assets from existing album" do
        response = Chute::V2::Albums.remove_assets(id, asset_ids)
        response.should be_true
      end

    end

    describe "POST to import Assets" do

      let(:id) { Chute::V2::Albums.create({:name => "Created Album"}).data.id }

      it "should be able to import assets from instagram_id" do
        VCR.insert_cassette 'albums/albums_import_assets_from_instagram_id', :record => :new_episodes
        response = Chute::V2::Albums.import_from_instagram(id, '428193445044210234_1895177')
        response.should be_true
        VCR.eject_cassette
      end

      it "should be able to import assets from urls" do
        VCR.insert_cassette 'albums/albums_import_assets', :record => :new_episodes
        response = Chute::V2::Albums.import(id, "http://instagram.com/p/aUxwpugsqp/")
        response.should be_true
        VCR.eject_cassette
      end

    end

  end

end
