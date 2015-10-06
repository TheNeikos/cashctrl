class AddMoneyToLedgers < ActiveRecord::Migration
  def change
    remove_column :ledgers, :currency
    add_money :ledgers, :amount
  end
end
