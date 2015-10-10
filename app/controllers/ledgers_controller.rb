class LedgersController < ApplicationController
  before_filter :require_login
  before_filter :load_user

  def new
    @ledger = current_user.ledgers.build
  end

  def create
    @ledger = current_user.ledgers.build new_ledger_params

    if @ledger.save
      redirect_to @ledger
    else
      render :new
    end
  end

  def show
    @ledger = Ledger.find(params[:id])
  end

  def edit
  end

  def update
  end

  def index
    @ledgers = @user.ledgers
  end

  def delete
  end

  private

  def load_user
    @user = User.find params[:user_id]
  end

  def new_ledger_params
    params.require(:ledger).permit(:name, :description, :amount, :amount_currency)
  end
end
