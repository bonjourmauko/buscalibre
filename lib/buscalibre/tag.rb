module Buscalibre
  class Tag < Buscalibre::Base
    def self.tree
      response = Typhoeus::Request.get( "http://www.buscalibre.com/api.php/categoria_tree" )
      body     = Yajl::Parser.parse( response.body )
      body.recursive_symbolize_keys![:categorias]
    end
  end
end