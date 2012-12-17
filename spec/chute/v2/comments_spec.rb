require 'spec_helper'

describe Chute::V2::Comments do
  include_context "init credentials"

  let(:album_id) do
    Chute::V2::Albums.create({:name => "Album for Comments"}).data.id
  end

  let(:asset_id) do
    Chute::V2::Albums.import(album_id,'http://farm9.staticflickr.com/8194/8141607138_bfaea3afd9.jpg').data[0].id
  end

  describe ".all" do
    it { Chute::V2::Comments.should respond_to(:all).with(2).arguments }
    it { Chute::V2::Comments.should_not respond_to(:all).with(1).arguments }
  end

  describe ".create" do
    it { Chute::V2::Comments.should respond_to(:create).with(3).arguments }
    it { Chute::V2::Comments.should_not respond_to(:create).with(1).arguments }
  end

  describe ".delete" do
    it { Chute::V2::Comments.should respond_to(:delete).with(1).arguments }
    it { Chute::V2::Comments.should_not respond_to(:delete).with(0).arguments }
  end


  describe "POST Comment Create" do

    before do
      VCR.insert_cassette 'comments/comments_create', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should be able to create new comments" do
      email = "random@someemail.com"
      name = "Darko"
      comment = "Some random comment"

      response = Chute::V2::Comments.create(album_id,asset_id, :comment_text => comment, :name => name , :email => email )
      response.data.comment_text.should == comment
      response.data.name.should == name
      response.data.email.should == email
    end

  end

  describe "GET List all comments" do

    before do
      VCR.insert_cassette 'comments/comments_list', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should list all comments" do
      response = Chute::V2::Comments.create(album_id,asset_id, :comment_text => "My Test Comment for listing")
      comment_id = response.data.id
      response = Chute::V2::Comments.all(album_id,asset_id)
      response.success?.should == true
      response.data.empty?.should == false
    end
  end

  describe "DELETE comment" do

    before do
      VCR.insert_cassette 'comments/comments_delete', :record => :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it "should delete comment by id" do
      pending "FIX Needs to be deployed to server"
      response = Chute::V2::Comments.create(album_id,asset_id, :comment_text => "My Test Comment for delete")
      comment_id = response.data.id
      response = Chute::V2::Comments.delete(comment_id)
      response.success?.should == true
    end
  end

end