class RenameUserIdIdToUserIdForSessions < ActiveRecord::Migration
  def change
    rename_column :sessions, :user_id_id, :user_id
  end
end
