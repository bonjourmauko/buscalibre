require 'spec_helper'

describe Buscalibre::Base do
  context "given a new instance of the base class is created" do
    let!(:base) { Buscalibre::Base.new('development', Dir.pwd, { "api_key" => "asdf1234", "user" => "asdf1234" } ) }

    it "should have an api key" do
      base.settings['api_key'].should == "asdf1234"
    end

    it "should have a user" do
      base.settings['user'].should == "asdf1234"
    end
  end
end