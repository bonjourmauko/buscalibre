module Buscalibre
  class Product < Buscalibre::Base
    def initialize
      super unless defined? @@settings
    end

    def self.find id
      response = Typhoeus::Request.get( "http://www.buscalibre.com/api.php/s/product/get?id=#{id}&user=#{@@settings['user']}&key=#{@@settings['api_key']}" )
      body     = Yajl::Parser.parse( response.body )

      # if the product exists
      return body.first.recursive_symbolize_keys! if body.instance_of?(Array)

      # else
      return nil
    end

    def self.within range = 1..10, opts = { validate: true }
      Array.new.tap do |products|
        range.each do |id|
          product = self.find id
          products.push product if product and not opts[:validate]
          products.push product if product and opts[:validate] and self.valid?(product)
        end
      end
    end

    def self.valid? product
      return false unless product[:nombre]
      return false unless product[:descripcion]
      return false unless product[:currency]
      return false unless product[:country]
      return false unless product[:price]
      return false unless product[:images]
      return false unless product[:images].first
      return false unless product[:categorias]
      return false unless product[:categorias][:categoria]
      return false unless product[:categorias][:categoria][:id]
      return false unless product[:categorias][:categoria][:url]
      return false unless product[:categorias][:categoria][:nombre]
      return false unless product[:variaciones]
      return false unless product[:variaciones].first
      return false unless product[:variaciones].first[:proveedores]
      return false unless product[:variaciones].first[:proveedores].first
      return false unless product[:variaciones].first[:proveedores].first[:stock]
      return false unless product[:variaciones].first[:proveedores].first[:precio_en_destino]
      return false unless product[:variaciones].first[:proveedores].first[:dias_transporte]
      return false unless product[:variaciones].first[:proveedores].first[:disponibilidad]
      return true
    end
  end
end