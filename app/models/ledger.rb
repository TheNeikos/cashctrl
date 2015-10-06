class Ledger < ActiveRecord::Base
  belongs_to :user

  monetize :amount_cents

  validates :name, presence: true

end
