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
      result = Yajl::HttpStream.get( URI.parse( "http://www.buscalibre.com/api.php/s/#{resource}/get?id=#{id}&user=#{@@settings['user']}&key=#{@@settings['api_key']}" ), symbolize_keys: true )
    end
  end
end