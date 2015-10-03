class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user_id, index: true, foreign_key: true
      t.string :hash

      t.timestamps null: false
    end
  end
end
