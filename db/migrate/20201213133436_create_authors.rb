class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name, :last_name, :gender
      t.datetime :birthday
      t.timestamps
    end
  end
end
