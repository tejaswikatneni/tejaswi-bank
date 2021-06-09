class Transaction < ApplicationRecord
  enum transaction_type: %i[credit debit]

  def create_transaction(params)
    Transaction.create(params)
  end
end
