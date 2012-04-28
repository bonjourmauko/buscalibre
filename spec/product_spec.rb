require 'spec_helper'

describe Buscalibre::Product do
  # we need to succesfully load the class variables before each test
  let!(:base)             { Buscalibre::Base.new('development', Dir.pwd) }
  let!(:valid_product)    { Buscalibre::Product.find 118 }
  let!(:invalid_product)  { Buscalibre::Product.find 10000000000000 }

  context "given we have a valid product id", :product do
    it { valid_product.should be_an_instance_of  Hash    }
    it { valid_product[:id_producto].to_i.should ==  118 }
    it { valid_product[:nombre].should_not        be  nil }
    it { valid_product[:descripcion].should_not   be  nil }
    it { valid_product[:currency].should_not      be  nil }
    it { valid_product[:country].should_not       be  nil }
    it { valid_product[:price].should_not         be  nil }
    it { valid_product[:images].first.should_not  be  nil }
    it { valid_product[:categorias][:categoria].should_not                                                      be  nil }
    it { valid_product[:categorias][:categoria][:childs][:categoria].should_not                                 be  nil }
    it { valid_product[:categorias][:categoria][:childs][:categoria][:childs][:categoria].should_not            be  nil }
    it { valid_product[:categorias][:categoria][:childs][:categoria][:childs][:categoria][:childs].first.should be  nil }
    it { valid_product[:variaciones].first.should_not                                           be  nil }
    it { valid_product[:variaciones].first[:proveedores].first.should_not                       be  nil }
    it { valid_product[:variaciones].first[:proveedores].first[:stock].should_not               be  nil }
    it { valid_product[:variaciones].first[:proveedores].first[:precio_en_destino].should_not   be  nil }
    it { valid_product[:variaciones].first[:proveedores].first[:dias_transporte].should_not     be  nil }
    it { valid_product[:variaciones].first[:proveedores].first[:disponibilidad].should_not      be  nil }
  end

  context "given we have an invalid product id" do
    it { invalid_product.should be_an_instance_of Hash }
    it { invalid_product[:success].to_i.should == 0    }
    it { invalid_product[:code].to_i.should    == 2    }
    it { invalid_product[:message].should      == "No se encontro el producto solicitado" }
  end
end