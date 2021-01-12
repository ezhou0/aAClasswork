class DeleteSubIdFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_index :posts, :sub_id
  end
end
