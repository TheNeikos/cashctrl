class TransactionsController < ApplicationController
  before_filter :require_login
  before_filter :load_ledger

  def new
    @transaction = @ledger.transactions.build
  end

  def create
    @transaction = @ledger.transactions.build new_transaction_params

    if @transaction.save then
      redirect_to @ledger
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def delete
  end

  def show
  end

  private

  def load_ledger
    @ledger = Ledger.find(params[:ledger_id])
  end

  def new_transaction_params
    params.require(:transaction).permit(:name, :description, :amount, :amount_currency, :sender_id, :receiver_id)
  end
end
