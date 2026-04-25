class AddGuestToUsers < ActiveRecord::Migration[8.1]
  class MigrationUser < ApplicationRecord
    self.table_name = "users"
  end

  def up
    add_column :users, :guest, :boolean, default: false, null: false

    MigrationUser.where("email LIKE ?", "guest_%@example.com").update_all(guest: true)
  end

  def down
    remove_column :users, :guest
  end
end
