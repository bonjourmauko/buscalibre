module Buscalibre
  class Base
    def initialize
      @@settings    ||= self.load File.join(Rails.root, 'config', 'buscalibre.yml')
      @@env         ||= Rails.env
      @@credentials ||= @@settings[@@env]
    end

    def load(file)
      YAML.load_file file
    end

    def api_call resource, id
      Yajl::Parser.parse( Typhoeus::Request.get( "http://www.buscalibre.com/api.php/s/#{resource}/get?id=#{id}&user=#{@@settings['user']}&key=#{@@settings['api_key']}" ).body, symbolize_keys: true ).first
    end
  end
end