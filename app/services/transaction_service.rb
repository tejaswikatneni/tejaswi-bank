class TransactionService
  def initialize(params = {})
    @credit_account_id = params[:credit_account_id]
    @transfer_amount = params[:transfer_amount]
    @debit_account = params[:debit_account]
  end

  def transfer
    service_charge = calculate_service_charge
    amount = (@transfer_amount + service_charge)
    errors = []
    errors << 'Account does not exist' if Account.where(account_number: @credit_account_id).empty?
    errors << 'Amount should be greater than zero' if @transfer_amount.zero? || @transfer_amount.negative?
    errors << 'Insufficient funds' if @debit_account.balance < amount
    response = {}

    if errors.empty?
      ActiveRecord::Base.transaction do
        credit_account = fetch_account(@credit_account_id)
        @debit_account.balance = @debit_account.balance - amount
        credit_account.balance = credit_account.balance + @transfer_amount
        @debit_account.save
        credit_account.save
        @debit_account.transactions.create(
          credit_account_id: @credit_account_id,
          service_charge: service_charge,
          transaction_type: Transaction.transaction_types['debit'],
          amount: @transfer_amount
        )
        credit_account.transactions.create(
          debit_account_id: @debit_account.account_number,
          transaction_type: Transaction.transaction_types['credit'],
          amount: @transfer_amount
        )
      end
      response[:message] = 'Success'
      response[:status] = :ok
    else
      response[:message] = errors.to_sentence
      response[:status] = :unprocessable_entity
    end
    response
  rescue StandardError => e
    response[:message] = e.message
    response[:status] = :unprocessable_entity
    response
  end

  private

  def fetch_account(account_id)
    Account.find_by(account_number: account_id)
  end

  def calculate_service_charge
    @transfer_amount * 0.01
  end
end
