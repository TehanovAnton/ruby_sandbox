require_relative 'src/api/merchants_api'
require_relative 'src/payments_report'
require_relative 'src/merchants_payments_collection'

merchants_ids = MerchantsApi.merchants_ids
payments = MerchantsPaymentsCollection.call(merchants_ids)
PaymentsReport.call(payments)
