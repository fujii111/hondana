class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :members, index: true
      t.references :bookinfos, index: true
      t.float :height
      t.float :width
      t.float :thick
      t.float :weight
      t.integer :state
      t.boolean :sunburn
      t.boolean :scar
      t.integer :graffiti
      t.integer :broken
      t.boolean :obi
      t.boolean :smoke
      t.boolean :pet
      t.boolean :mold
      t.string :remarks
      t.integer :books_flag
      t.datetime :entry_date

      t.timestamps
    end
  end
end
