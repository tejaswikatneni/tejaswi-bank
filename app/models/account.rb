class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :debit_transactions, lambda {
    where(transaction_type: Transaction.transaction_types['debit'])
  }, class_name: 'Transaction'
  has_many :credit_transactions, lambda {
    where(transaction_type: Transaction.transaction_types['credit'])
  }, class_name: 'Transaction'

  before_create :generate_account_number

  def make_transfer(credit_account_id, transfer_amount)
    transaction_service = TransactionService.new({
                                                   credit_account_id: credit_account_id,
                                                   transfer_amount: transfer_amount,
                                                   debit_account: self
                                                 })
    transaction_service.transfer
  end

  def as_json(options = {})
    if options == 'summary'
      super(only: [:balance], methods: [:last_ten_transactions])
    else
      super(only: %i[id account_number balance])
    end
  end

  def last_ten_transactions
    transactions.last(10)
  end

  private

  def generate_account_number
    self.account_number = 14.times.map { rand(10) }.join.to_i
    generate_account_number if self.class.where(account_number: account_number).exists?
  end
end
