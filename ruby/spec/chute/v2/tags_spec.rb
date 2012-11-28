require 'spec_helper'

describe Chute::V2::Tags do
  include_context "init credentials"

  describe ".tags" do
    it { Chute::V2::Tags.should respond_to(:tags).with(1).arguments }
    it { Chute::V2::Tags.should_not respond_to(:tags).with(2).arguments }
  end

  describe ".update_tags" do
    it { Chute::V2::Tags.should respond_to(:update_tags).with(2).arguments }
    it { Chute::V2::Tags.should_not respond_to(:update_tags).with(3).arguments }
  end

end