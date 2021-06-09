class Api::V1::AccountsController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_account

  def account_summary
    render json: { status: 'Success', account_summary: @account.as_json('summary') }
  end

  def transfer
    credit_account = Account.find(credit_account_params[:credit_account_id])
    transfer_amount = credit_account_params[:amount].to_f
    error = @account.make_transfer(credit_account.account_number, transfer_amount)
    if error.present?
      render json: { message: error }
    else
      render json: { status: 'Success', balance: @account.balance }
    end
  end

  private

  def set_account
    user = User.find_by(id: params[:user_id])
    @account = user.accounts.find_by(id: params[:account_id])
  end

  def credit_account_params
    params.require(:account).permit(:credit_account_id, :amount)
  end
end
