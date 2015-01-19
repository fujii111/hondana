class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :members, index: true, null: false
      t.references :bookinfos, null: false,uniqueness: true
      t.float :height, null: false
      t.float :width, null: false
      t.float :thick, null:false
      t.float :weight, null:false
      t.integer :state, null:false
      t.integer :sunburn, null:false
      t.integer :scar, null:false
      t.integer :graffiti, null:false
      t.integer :broken, null:false
      t.integer :obi, null:false
      t.integer :smoke, null:false
      t.integer :pet, null:false
      t.integer :mold, null:false
      t.string :remarks
      t.integer :books_flag, null:false,:default => 0
      t.timestamps
    end
  end
end
