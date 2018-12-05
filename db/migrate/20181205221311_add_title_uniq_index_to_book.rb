class AddTitleUniqIndexToBook < ActiveRecord::Migration[5.1]
  def change
    add_index :books, [:title], unique: true
  end
end
