class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|
      
    end
    remove_column :users, :name
    remove_column :users, :email

    add_column :users, :username, :string
    add_index :users, :username, unique: true

  end
end
