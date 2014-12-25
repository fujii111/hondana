class CreateRakutens < ActiveRecord::Migration
  def change
    create_table :rakutens do |t|

      t.timestamps
    end
  end
end
