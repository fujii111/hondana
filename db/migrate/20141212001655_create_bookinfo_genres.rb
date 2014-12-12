class CreateBookinfoGenres < ActiveRecord::Migration
  def change
    create_table :bookinfo_genres do |t|
      t.references :bookgenres  ,null: false
      t.references :bookinfos  ,null: false
      t.timestamps
    end
      #add_foreign_key :bookinfo_genres, :bookgenres
      #add_foreign_key :bookinfo_genres, :bookinfos
  end
end
