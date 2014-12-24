class CreateBookgenres < ActiveRecord::Migration
  def change
    create_table :bookgenres do |t|
      t.string :name, null:false,uniqueness: true
      t.integer :sort, null:false

      t.timestamps
    end
  end
end
