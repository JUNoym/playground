class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :ancestry
      t.timestamps
    end
  end
end
