require_relative 'src/merchant_processor'
require_relative 'src/merchant_api'
require_relative 'src/payment_report'

merchant_id = 'M28A9'
data = MerchantApi.merchant(merchant_id)
merchant_info = MerchantProcessor.call(**data.transform_keys(&:to_sym))
payments = [[merchant_info.iban, merchant_info.payable_amount]]
PaymentsReport.call(payments)
