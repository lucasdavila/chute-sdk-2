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
end
