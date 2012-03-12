module Buscalibre
  class Base
    def initialize
      @@settings    ||= self.load File.join(Rails.root, 'config', 'buscalibre.yml')
      @@env         ||= Rails.env
      @@credentials ||= @@settings[@@env]
      @@parser      ||= Yajl::Parser.new symbolize_keys: true
    end

    def load(file)
      YAML.load_file file
    end

    def api_call resource, id
      @@parser.parse Nestful.get("http://www.buscalibre.com/api.php/s/#{resource}/get?id=#{id}&user=#{@@settings['user']}&key=#{@@settings['api_key']}")
    end
  end
end