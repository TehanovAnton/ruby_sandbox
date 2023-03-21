# frozen_string_literal: true

class MerchantProcessor
  attr_reader :id, :iban, :discount, :transactions, :total_fee, :total_amount, :payable_amount, :applicable_discount

  def initialize(id:, iban:, discount:, transactions:)
    @id = id
    @iban = iban
    @discount = discount
    @transactions = transactions
    @total_amount = 0
    @total_fee = 0
  end

  def self.call(**args)
    new(**args).call
  end

  def call
    calculate_totals

    self
  end

  private

  def calculate_totals
    transactions.each do |transaction|
      @total_amount += transaction['amount']
      @total_fee += transaction['fee']
    end

    @applicable_discount = discount? ? calculate_discount : 0
    @payable_amount = total_amount - total_fee + applicable_discount
  end

  def calculate_discount
    total_fee * discount['fees_discount'] / 100
  end

  def discount?
    transactions.count >= discount['minimum_transaction_count']
  end
end
