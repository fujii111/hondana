class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :login_id,null: false
      t.string :name,null: false
      t.string :kana,null: false
      t.date :birthday,null: false
      t.string :password_digest,null: false
      t.string :nickname,null: false
      t.string :mail_address
      t.string :address,null: false
      t.integer :point,null: false,:default => 0
      t.boolean :quit,null: false,:default => 0

      t.timestamps
    end
  end
end
