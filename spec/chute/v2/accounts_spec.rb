require 'spec_helper'
# -*- coding: utf-8 -*-

describe Chute::V2::Accounts do
  include_context "init credentials"

  describe "methods" do

    describe ".find" do
      it { Chute::V2::Accounts.should respond_to(:find).with(1).arguments }
      it { Chute::V2::Accounts.should_not respond_to(:find).with(0).arguments }
    end

    describe ".me" do
      it { Chute::V2::Accounts.should respond_to(:me).with(0).arguments }
      it { Chute::V2::Accounts.should_not respond_to(:me).with(1).arguments }
    end
  end

  describe "requests" do
    describe "GET Accounts List" do
      before do
        VCR.insert_cassette 'accounts/me', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to list all of a users accounts" do
        response = Chute::V2::Accounts.me
        response.data.should_not == nil
      end
    end

    describe "GET Account" do
      before do
        VCR.insert_cassette 'accounts/find', :record => :new_episodes
      end
      after do
        VCR.eject_cassette
      end

      it "should be able to fetch info about an account" do
        response = Chute::V2::Accounts.find(666)
        response.data.should_not == nil
      end
    end
  end
end

