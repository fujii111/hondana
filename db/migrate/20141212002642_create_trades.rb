class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.datetime :request_date
      t.datetime :receipt_date
      t.datetime :send_date
      t.datetime :complete_date
      t.integer :receipt_members ,null: false
      t.integer :delivery_members ,null: false
      t.integer :books_id ,null: false
      t.integer :trades_flag ,null: false
      t.timestamps
    end
  end
end
