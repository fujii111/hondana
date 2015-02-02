class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :members  ,null: false
      t.string :title ,null: false
      t.string :content ,null: false
      t.string :url
      t.integer :read_flag,:default => 0
      t.timestamps
    end
      #add_foreign_key :notices, :members
  end
end
