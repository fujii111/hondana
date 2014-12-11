class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.string :not
      t.string :null
      t.string :sort
      t.string :int
      t.string :not
      t.string :null

      t.timestamps
    end
  end
end
