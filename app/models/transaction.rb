class Transaction < ActiveRecord::Base
  belongs_to :sender, class_name: "Ledger"
  belongs_to :receiver, class_name: "Ledger"

  monetize :amount
end
