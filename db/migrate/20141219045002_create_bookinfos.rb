class CreateBookinfos < ActiveRecord::Migration
  def change
    create_table :bookinfos do |t|
      t.references :members,null: false
      t.string :name,null: false
      t.string :publisher,null: false
      t.string :author,null: false
      t.string :langage
      t.string :release_date
      t.float :height
      t.float :width
      t.float :thinck
      t.string :isbn10
      t.string :isbn13
      t.string :content
      t.string :picture

      t.timestamps
    end
  end
end
