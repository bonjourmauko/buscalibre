module Buscalibre
  class Tag < Buscalibre::Base
    def self.tree
      Yajl::Parser.parse( Typhoeus::Request.get( "http://www.buscalibre.com/api.php/categoria_tree" ).body ).recursive_symbolize_keys![:categorias]
    end
  end
end