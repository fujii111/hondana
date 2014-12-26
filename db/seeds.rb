# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

Book.create(:members_id => '1', :bookinfos_id => '1', :height => '10.0',:width => '20.0', :thick => '15.0',
             :weight => '50', :state => '3', :sunburn => '0', :scar => '0', :graffiti => '0', :broken => '0',
             :obi => '0', :smoke => '0', :pet => '0', :mold => '0', :remarks => '帯つきです。少し汚れはありますが読むのに支障はありません。',
             :books_flag => '0', :entry_date => '2014-12-25 00:00:00')


Trade.create(:request_date => '2014-10-10 10:10:10', :receipt_date => '2014-10-12 12:12:12',
              :send_date => '2014-10-19 07:02:15',:complete_date => '2014-10-20 00:12:12', :receipt_members => '1',
              :delivery_members => '2', :books_id => '1', :carriers_id => '1', :tracking_number => '0000000001', :trades_flag => '3')
Trade.create(:request_date => '2014-10-11 10:10:10', :receipt_date => '2014-10-13 12:12:12',
              :send_date => '2014-10-20 07:02:15',:complete_date => '2014-10-21 00:12:12', :receipt_members => '2',
              :delivery_members => '1', :books_id => '2', :carriers_id => '2', :tracking_number => '0000000002', :trades_flag => '2')