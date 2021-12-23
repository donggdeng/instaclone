class AddFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :from_user, references: :user, index: true, null: false, foreign_key: {to_table: :users, on_delete: :cascade}
      t.references :to_user, references: :user, index: true, null: false, foreign_key: {to_table: :users, on_delete: :cascade}
      t.timestamps
    end
  end
end
