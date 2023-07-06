class AddDescriptionToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :description, :string
  end
end
