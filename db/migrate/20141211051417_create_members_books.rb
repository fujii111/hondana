class CreateMembersBooks < ActiveRecord::Migration
  def change
    create_table :members_books do |t|
      t.references :members  ,null: false
      t.references :books  ,null: false,uniqueness: true
      t.date :entry_date ,null: false
      t.integer :sort ,null: false

      t.timestamps
    end
      #add_foreign_key :members_books, :members
      #add_foreign_key :members_books, :books
  end
end
