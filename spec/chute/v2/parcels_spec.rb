require 'spec_helper'

describe Chute::V2::Albums do
  include_context "init credentials"

  describe "methods" do

    describe ".all_parcel_assets" do
      it { Chute::V2::Parcels.should respond_to(:all_parcel_assets).with(1).arguments }
      it { Chute::V2::Parcels.should_not respond_to(:all_parcel_assets).with(0).arguments }
    end

    describe ".find" do
      it { Chute::V2::Parcels.should respond_to(:find).with(1).arguments }
      it { Chute::V2::Parcels.should_not respond_to(:find).with(0).arguments }
    end

    describe ".all_album_parcels" do
      it { Chute::V2::Parcels.should respond_to(:all_album_parcels).with(1).arguments }
      it { Chute::V2::Parcels.should_not respond_to(:all_album_parcels).with(0).arguments }
    end

  end
end
