class AddPublisherIdToBooks < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :books, column: :publisher_id
    change_column_null :books, :publisher_id, false
    add_foreign_key :books, :publishers
  end
end
