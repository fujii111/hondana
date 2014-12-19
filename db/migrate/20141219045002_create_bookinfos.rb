class CreateBookinfos < ActiveRecord::Migration
  def change
    create_table :bookinfos do |t|
      t.string :name,null: false
      t.string :publisher,null: false
      t.string :author,null: false
      t.string :langage,null: false
      t.date :release_date,null: false
      t.float :height,null: false
      t.float :width,null: false
      t.float :thinck,null: false
      t.string :isbn10
      t.string :isbn13
      t.string :content
      t.string :picture

      t.timestamps
    end
  end
end
