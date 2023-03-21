# frozen_string_literal: true

require 'json'
require_relative 'api'

class MerchantsApi < Api
  MERCHANTS_URI = 'https://simpledebit.gocardless.io/merchants/'

  class << self
    def merchants_ids
      uri = build_uri(MERCHANTS_URI)
      response = get(uri)
      JSON.parse(response)
    end
  end
end
