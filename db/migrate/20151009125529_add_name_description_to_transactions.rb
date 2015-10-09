class AddNameDescriptionToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :name, :text
    add_column :transactions, :description, :text
  end
end
