class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :login_id,null: false
      t.string :name,null: false
      t.string :kana,null: false
      t.date :birthday,null: false
      t.string :password,null: false
      t.string :nickname,null: false
      t.string :mail_address,null: false
      t.string :address,null: false
      t.integer :point
      t.boolean :quit
      t.timestamps
    end
  end
end
