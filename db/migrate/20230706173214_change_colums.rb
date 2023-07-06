class ChangeColums < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :description, :string
    add_column :foods, :description , :string, after: :name
  end
end
