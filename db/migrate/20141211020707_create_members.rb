class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string(30) :login_id
      t.string :not
      t.string :null
      t.string :name
      t.string :not
      t.string :null
      t.string :kana
      t.string :not
      t.string :null
      t.date :birthday
      t.string :not
      t.string :null
      t.string(15) :password
      t.string :not
      t.string :null
      t.string(10) :nickname
      t.string :not
      t.string :null
      t.string :mail_address
      t.string :not
      t.string :null
      t.string :address
      t.string :not
      t.string :null
      t.int :point
      t.string :quit
      t.string :boolean

      t.timestamps
    end
  end
end
