class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :members  ,null: false
      t.references :bookinfos  ,null: false
      t.float :height ,null: false
      t.float :width ,null: false
      t.float :thick ,null: false
      t.float :weight ,null: false
      t.integer :state ,null: false
      t.boolean :sunburn ,null: false
      t.boolean :scar ,null: false
      t.integer :graffiti ,null: false
      t.integer :broken ,null: false
      t.boolean :obi ,null: false
      t.boolean :smoke ,null: false
      t.boolean :pet ,null: false
      t.boolean :mold ,null: false
      t.string :remarks
      t.integer :books_flag ,null: false
      t.date :entry_date ,null: false

      t.timestamps
    end
      #add_foreign_key :books, :members
      #add_foreign_key :books, :bookinfos

  end
end
