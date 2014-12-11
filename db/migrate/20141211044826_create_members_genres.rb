class CreateMembersGenres < ActiveRecord::Migration
  def change
    create_table :members_genres do |t|
      t.references :members  ,null: false
      t.references :bookgenres  ,null: false
      t.integer :sort ,null: false

      t.timestamps
    end
    #add_foreign_key :members_genres, :members
    #add_foreign_key :members_genres, :bookgenres
  end
end
