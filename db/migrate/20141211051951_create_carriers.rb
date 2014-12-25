class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name ,null: false,uniqueness: true

      t.timestamps
    end
  end
end
