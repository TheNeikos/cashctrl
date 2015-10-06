class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.decimal :currency, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
