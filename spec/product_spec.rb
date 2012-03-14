require 'spec_helper'

describe Buscalibre::Product do
  # we need to succesfully load the class variables before each test
  let!(:base) { Buscalibre::Base.new('development', Dir.pwd) }

  context "given we have a product id" do
    it "should retrieve us a hash with the parsed json response" do
      product = Buscalibre::Product.find 1
      product.should be_an_instance_of Hash
    end
  end
end