class CreateBookinfos < ActiveRecord::Migration
  def change
    create_table :bookinfos do |t|
      t.string :name
      t.string :not
      t.string :null
      t.string :publisher
      t.string :not
      t.string :null
      t.string :author
      t.string :not
      t.string :null
      t.string :langage
      t.string :not
      t.string :null
      t.date :release_date
      t.string :not
      t.string :null
      t.float :height
      t.string :not
      t.string :null
      t.float :width
      t.string :not
      t.string :null
      t.float :thinck
      t.string :not
      t.string :null
      t.string :isbn10
      t.string :isbn13
      t.string :content
      t.string :picture

      t.timestamps
    end
  end
end
