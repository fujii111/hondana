class CreateBookgenres < ActiveRecord::Migration
  def change
    create_table :bookgenres do |t|
      t.string :name
      t.integer :sort

      t.timestamps
    end
  end
end
