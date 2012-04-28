module Buscalibre
  class Product < Buscalibre::Base
    def initialize
      super unless defined? @@settings
    end

    def self.find id
      response = Typhoeus::Request.get( "http://www.buscalibre.com/api.php/s/product/get?id=#{id}&user=#{@@settings['user']}&key=#{@@settings['api_key']}" )
      body     = Yajl::Parser.parse( response.body )

      # if the product exists
      return body.first.recursive_symbolize_keys! if body.instance_of? Array

      # else
      return body.recursive_symbolize_keys!
    end
  end
end