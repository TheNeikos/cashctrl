class Transaction < ActiveRecord::Base
  belongs_to :sender, class_name: "Ledger", :inverse_of => :out_transactions
  belongs_to :receiver, class_name: "Ledger", :inverse_of => :in_transactions

  validates :sender, presence: true
  validates :receiver, presence: true

  monetize :amount_cents

  after_create do
    self.sender.update_attribute :amount, self.sender.amount - self.amount
    self.receiver.update_attribute :amount, self.receiver.amount + self.amount
  end

  after_destroy do
    self.sender.update_attribute :amount, self.sender.amount + self.amount
    self.receiver.update_attribute :amount, self.receiver.amount - self.amount
  end
end
