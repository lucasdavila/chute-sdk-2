require 'spec_helper'

describe Chute::Response do

    it { Chute::Response.should respond_to(:with_code_and_error).with(2).arguments }
    it { Chute::Response.new.should respond_to(:success?).with(0).arguments }
    it { Chute::Response.new.should respond_to(:pretty_print).with(0).arguments }

    context '#with_code_and_error' do
      it 'should work' do
        obj = Chute::Response.with_code_and_error(500, 'broke')
        obj.inspect
      end
    end

end
