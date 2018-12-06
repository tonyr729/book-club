class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
    end
    add_index :users, :name, unique: true
  end
end
