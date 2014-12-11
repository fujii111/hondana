class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name ,null: false

      t.timestamps
    end
  end
end
