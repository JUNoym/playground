class DropUsersTable < ActiveRecord::Migration[6.0]  # バージョン番号を6.0に修正
  def up
    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
