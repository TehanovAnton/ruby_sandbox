# frozen_string_literal: true

require 'csv'

class PaymentsReport
  HEADERS = %w[iban amount_in_pence].freeze
  REPORTS_PATH = './simple_debit/reports/' # TODO: realtive to ./reports
  DEFAULT_TIMESTAMP_FORMAT = '%d%m%y_%H%M%S'

  attr_reader :payments

  def initialize(payments)
    @payments = payments
  end

  def self.call(payments)
    new(payments).call
  end

  def call
    timestamp = Time.now.strftime(DEFAULT_TIMESTAMP_FORMAT)
    filename = "#{timestamp}.csv"
    filetpath = REPORTS_PATH + filename

    CSV.open(filetpath, 'wb') do |csv|
      csv << HEADERS

      payments.each do |payment|
        csv << payment
      end
    end
  end
end
