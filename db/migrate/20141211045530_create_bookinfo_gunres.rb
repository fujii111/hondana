class CreateBookinfoGunres < ActiveRecord::Migration
  def change
    create_table :bookinfo_gunres do |t|
      t.references :bookgenres  ,null: false
      t.references :bookinfos  ,null: false
      t.timestamps
    end
      #add_foreign_key :bookinfo_gunres, :bookgenres
      #add_foreign_key :bookinfo_gunres, :bookinfos
  end
end
