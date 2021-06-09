class Transaction < ApplicationRecord
  enum transaction_type: %i[credit debit]
end
