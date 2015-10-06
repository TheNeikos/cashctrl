class Ledger < ActiveRecord::Base
  belongs_to :user
  has_many :out_transactions, foreign_key: "sender_id"
  has_many :in_transactions, foreign_key: "receiver_id"

  monetize :amount_cents

  validates :name, presence: true

  def transactions
    Transaction.where('sender_id = ? OR receiver_id = ?', id, id)
  end

end
