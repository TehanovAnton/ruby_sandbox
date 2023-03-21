# frozen_string_literal: true

require 'net/http'

class Api
  class << self
    private

    def build_uri(url, path = '')
      URI(url + path)
    end

    def get(uri)
      Net::HTTP.get(uri)
    end
  end
end
