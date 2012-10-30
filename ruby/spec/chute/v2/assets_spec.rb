require 'spec_helper'

describe Chute::V2::Assets do
  include_context "init credentials"

  describe "methods" do

    describe ".all" do
      it { Chute::V2::Assets.should respond_to(:all).with(0).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:all).with(1).arguments }
    end

    describe ".find" do
      it { Chute::V2::Assets.should respond_to(:find).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:find).with(0).arguments }
    end

    describe ".geo_search" do
      it {  Chute::V2::Assets.should respond_to(:geo_search).with(3).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:geo_search).with(4).arguments }
    end

    describe ".exif" do
      it {  Chute::V2::Assets.should respond_to(:exif).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:exif).with(2).arguments }
    end

    describe ".geo" do
      it {  Chute::V2::Assets.should respond_to(:geo).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:geo).with(2).arguments }
    end

    describe ".tags" do
      it {  Chute::V2::Assets.should respond_to(:tags).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:tags).with(2).arguments }
    end

    describe ".update_tags" do
      it {  Chute::V2::Assets.should respond_to(:update_tags).with(2).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:update_tags).with(3).arguments }
    end

    describe ".upload" do
      pending "Not implemented yet"
      it {  Chute::V2::Assets.should respond_to(:create).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:create).with(2).arguments }
    end

    describe ".update" do
      it {  Chute::V2::Assets.should respond_to(:update).with(2).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:update).with(3).arguments }
    end

    describe ".delete" do
      it {  Chute::V2::Assets.should respond_to(:delete).with(1).arguments }
      it {  Chute::V2::Assets.should_not respond_to(:delete).with(2).arguments }
    end

  end
end
