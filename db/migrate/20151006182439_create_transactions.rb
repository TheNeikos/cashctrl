class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :sender, index: true, foreign_key: true
      t.references :receiver, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.money :amount

      t.timestamps null: false
    end
  end
end
