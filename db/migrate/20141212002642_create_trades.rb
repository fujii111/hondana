class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.date :request_date
      t.date :receipt_date
      t.date :send_date
      t.date :complete_date
      t.integer :receipt_members ,null: false
      t.integer :delivery_members ,null: false
      t.integer :books_id ,null: false
      t.integer :carriers_id ,null: false
      t.integer :tracking_number ,null: false
      t.integer :trades_flag ,null: false
      t.timestamps
    end
  end
end
