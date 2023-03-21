# frozen_string_literal: true

require 'json'
require_relative 'api'

class MerchantApi < Api
  MERCHANT_URI = 'https://simpledebit.gocardless.io/merchants/'

  class << self
    def merchant(merchant_id)
      uri = build_uri(MERCHANT_URI, merchant_id)
      response = get(uri)
      JSON.parse(response)
    end
  end
end
