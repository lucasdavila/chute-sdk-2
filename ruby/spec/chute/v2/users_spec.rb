require 'spec_helper'

describe Chute::V2::Users do
  include_context "init credentials"

  describe "methods" do

    describe ".find" do
      it { Chute::V2::Users.should respond_to(:find).with(1).arguments }
      it {  Chute::V2::Users.should_not respond_to(:find).with(0).arguments }

    end

    describe ".me" do
      it {  Chute::V2::Users.should respond_to(:me).with(0).arguments }
      it {  Chute::V2::Users.should_not respond_to(:me).with(1).arguments }
    end

  end

  describe "requests" do

    describe "GET Current user info" do
      before do
        VCR.insert_cassette 'users/users_me', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should get the current user info" do
        response = Chute::V2::Users.me
      end

    end

    describe "GET User By Id" do
      before do
        VCR.insert_cassette 'users/users_get', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to get user by id" do
        response = Chute::V2::Users.me
        response = Chute::V2::Users.find(response.data.id)
      end

    end
  end

end
