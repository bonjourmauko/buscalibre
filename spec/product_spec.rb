require 'spec_helper'

describe Buscalibre::Product do
  # we need to succesfully load the class variables before each test
  let!(:base) { Buscalibre::Base.new('development', Dir.pwd) }

  context "find", :find do
    context "given we have an existing product id" do
      let!(:existing_product) { Buscalibre::Product.find 118 }

      it { existing_product.should be_an_instance_of   Hash    }
      it { existing_product[:id_producto].to_i.should  ==  118 }
      it { existing_product[:nombre].should_not        be  nil }
      it { existing_product[:descripcion].should_not   be  nil }
      it { existing_product[:currency].should_not      be  nil }
      it { existing_product[:country].should_not       be  nil }
      it { existing_product[:price].should_not         be  nil }
      it { existing_product[:images].first.should_not  be  nil }
      it { existing_product[:categorias][:categoria].should_not                                                      be  nil }
      it { existing_product[:categorias][:categoria][:childs][:categoria].should_not                                 be  nil }
      it { existing_product[:categorias][:categoria][:childs][:categoria][:childs][:categoria].should_not            be  nil }
      it { existing_product[:categorias][:categoria][:childs][:categoria][:childs][:categoria][:childs].first.should be  nil }
      it { existing_product[:variaciones].first.should_not                                           be  nil }
      it { existing_product[:variaciones].first[:proveedores].first.should_not                       be  nil }
      it { existing_product[:variaciones].first[:proveedores].first[:stock].should_not               be  nil }
      it { existing_product[:variaciones].first[:proveedores].first[:precio_en_destino].should_not   be  nil }
      it { existing_product[:variaciones].first[:proveedores].first[:dias_transporte].should_not     be  nil }
      it { existing_product[:variaciones].first[:proveedores].first[:disponibilidad].should_not      be  nil }
    end

    context "given we have a non-existing product id" do
      let!(:non_existing_product) { Buscalibre::Product.find 10000000000000 }

      it { non_existing_product.should be_an_instance_of NilClass }
    end
  end

  context "within", :within do
    it { Buscalibre::Product.within(1..10, validate: false).size.should_not == 0 }
    it { Buscalibre::Product.within(1..10, validate: true).size.should      == 0 }
  end

  context "valid?", :valid? do
    let!(:valid_product) { Buscalibre::Product.find 118 }

    it "should be true if the product has the required fields" do
      Buscalibre::Product.valid?(valid_product).should be true
    end

    it "should be false if the product has not the required fields" do
      valid_product.delete :price
      Buscalibre::Product.valid?(valid_product).should be false
    end
  end
end