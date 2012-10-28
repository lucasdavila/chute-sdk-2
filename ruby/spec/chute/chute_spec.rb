require_relative '../../spec/spec_helper'

describe Chute do
  class << self

  end
  it "should have api constants defined" do
    Chute.api_path.should == 'http://api.getchute.com'
    Chute.app_id.should == 'app_id'
    Chute.app_secret.should == 'app_secret'
    Chute.access_token.should == 'access_token'
  end
end
