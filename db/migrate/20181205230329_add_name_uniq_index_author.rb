class AddNameUniqIndexAuthor < ActiveRecord::Migration[5.1]
  def change
    add_index :authors, [:name], unique: true
  end
end
