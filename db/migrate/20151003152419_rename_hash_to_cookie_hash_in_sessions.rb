class RenameHashToCookieHashInSessions < ActiveRecord::Migration
  def change
    rename_column :sessions, :hash, :cookie_hash
  end
end
