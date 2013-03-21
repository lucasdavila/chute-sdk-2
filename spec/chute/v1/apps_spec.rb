require 'spec_helper'

describe Chute::V1::Apps do
  include_context "init credentials"


  describe "methods" do

    describe "requests" do
      describe "GET Apps List" do
        before do
          VCR.insert_cassette 'apps/apps_list', :record => :new_episodes
        end
        after do
          VCR.eject_cassette
        end

        it "should be able to list all apps" do
          response = Chute::V1::Apps.index
          puts response
          response.data.should_not == nil
        end
      end


    end
  end
end
