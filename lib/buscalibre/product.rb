module Buscalibre
  class Product < Buscalibre::Base
    def initialize
      super unless defined? @@settings
    end

    def self.find id
      response = Yajl::Parser.parse( Typhoeus::Request.get( "http://www.buscalibre.com/api.php/s/product/get?id=#{id}&user=#{@@settings['user']}&key=#{@@settings['api_key']}" ).body ).recursive_symbolize_keys!
      return response.first if response.instance_of? Array
      response
    end
  end
end