class CreateBookinfoGenres < ActiveRecord::Migration
  def change
    create_table :bookinfo_genres do |t|

      t.timestamps
    end
  end
end
