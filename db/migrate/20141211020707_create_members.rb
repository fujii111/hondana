class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :login_id
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
      t.string :password
      t.string :not
      t.string :null
      t.string :nickname
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
