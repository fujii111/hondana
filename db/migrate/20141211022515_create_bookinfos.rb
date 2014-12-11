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
      t.string(10) :isbn10
      t.string(13) :isbn
      t.string :content
      t.string :string
      t.string :picture
      t.string :string

      t.timestamps
    end
  end
end
