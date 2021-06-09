class Api::V1::AccountsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :fetch_account

  def account_summary
    render json: { message: 'Success', account_summary: @account.as_json('summary') }, status: :ok
  end

  def transfer
    credit_account = Account.find(credit_account_params[:credit_account_id])
    transfer_amount = credit_account_params[:amount].to_f
    response = @account.make_transfer(credit_account.account_number, transfer_amount)
    render json: { message: response[:message], balance: @account.balance }, status: :ok
  end

  private

  def fetch_account
    @account = Account.find(params[:id])
  end

  def credit_account_params
    params.require(:account).permit(:credit_account_id, :amount)
  end
end
