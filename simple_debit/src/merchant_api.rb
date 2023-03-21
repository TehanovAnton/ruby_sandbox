# frozen_string_literal: true

require 'net/http'
require 'json'

class MerchantApi
  MERCHANT_URI = 'https://simpledebit.gocardless.io/merchants/'

  class << self
    def merchant(merchant_id)
      uri = build_uri(merchant_id)
      response = get(uri)
      JSON.parse(response)
    end

    private

    def build_uri(path = '')
      URI(MERCHANT_URI + path)
    end

    def get(uri)
      Net::HTTP.get(uri)
    end
  end
end
