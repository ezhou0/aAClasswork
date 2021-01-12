class AddSubId < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sub_id, :integer, null: false
    add_index :posts, :sub_id, unique: true
  end
end
