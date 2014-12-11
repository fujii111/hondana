class CreateFavoriteAuthors < ActiveRecord::Migration
  def change
    create_table :favorite_authors do |t|
      t.references :members  ,null: false
      t.string :author ,null: false
      t.integer :sort ,null: false

      t.timestamps
    end

      #add_foreign_key :favorite_authors, :members
  end
end
