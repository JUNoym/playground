class AddDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :foods, :description, :string, default: "食べ物の感想を書いてください"
  end
end
