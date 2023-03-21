# frozen_string_literal: true

require_relative 'api/merchant_api'
require_relative 'merchant_processor'

class MerchantsPaymentsCollection
  attr_reader :payments

  def initialize(merchants_ids)
    @merchants_ids = merchants_ids
    @payments = []
  end

  def self.call(merchants_ids)
    new(merchants_ids).call.payments
  end

  def call
    merchants_ids.each do |merchant_id|
      merchant = MerchantApi.merchant(merchant_id)
      merchant_info = MerchantProcessor.call(**merchant.transform_keys(&:to_sym))
      @payments << [merchant_info.iban, merchant_info.payable_amount]
    end

    self
  end

  private

  attr_reader :merchants_ids
end
