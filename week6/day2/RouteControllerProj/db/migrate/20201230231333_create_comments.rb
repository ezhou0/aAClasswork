class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.body :comment_text, null: false
      t.timestamps
    end
  end
end
