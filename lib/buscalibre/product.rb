module Buscalibre
  class Product < Buscalibre::Base
    def initialize
      super unless defined? @@settings
    end

    def self.find id
      self.new.api_call 'product', id
    end
  end
end