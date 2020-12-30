class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name, :last_name, :gender, :email, :password_digest, avatar
      t.datetime :birthday
      t.boolean :admin, default: 0

      t.timestamps
    end
  end
end