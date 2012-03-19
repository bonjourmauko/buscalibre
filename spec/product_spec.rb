require 'spec_helper'

describe Buscalibre::Product do
  # we need to succesfully load the class variables before each test
  let!(:base) { Buscalibre::Base.new('development', Dir.pwd) }

  context "given we have a valid product id" do
    before :each do
      @product = Buscalibre::Product.find 1
    end

    it { @product.should be_an_instance_of  Hash    }
    it { @product[:id_producto].to_i.should ==  1   }
    it { @product[:producto].should_not     be  nil }
    it { @product[:currency].should_not     be  nil }
    it { @product[:country].should_not      be  nil }
    it { @product[:price].should_not        be  nil }
  end

  context "given we have an invalid product id" do
    before :each do
      @product = Buscalibre::Product.find 10000000000000
    end

    it { @product.should be_an_instance_of Hash }
    it { @product[:success].to_i.should == 0    }
    it { @product[:code].to_i.should    == 2    }
    it { @product[:message].should      == "No se encontro el producto solicitado" }
  end
end