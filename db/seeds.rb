# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bookinfo.create(id: 1, name: '書籍１', publisher: 'A社', author: 'Xさん', langage: '日本語', release_date: '19991010', height: '10', width: '20', thinck: '30', isbn10: '1234567890', isbn13: '1234567890123', content: 'すごい本です。', picture: 'picture.jpg')
Bookinfo.create(id: 2, name: '書籍２', publisher: 'B社', author: 'Yさん', langage: '英語', release_date: '20000220', height: '15', width: '25', thinck: '35', isbn10: '0987654321', isbn13: '3210987654321', content: 'つよい本です。', picture: 'photo.png')
Bookinfo.create(id: 3, name: '書籍３', publisher: 'C社', author: 'Zさん', langage: 'ドイツ語', release_date: '20101231', height: '100', width: '200', thinck: '300', isbn10: '1020304050', isbn13: '0102030405060', content: 'よわい本です。', picture: 'raphic.gif')

# coding: utf-8

Book.create(:members_id => '1', :bookinfos_id => '1', :height => '10.0',:width => '20.0', :thick => '15.0',
             :weight => '50', :state => '3', :sunburn => '0', :scar => '0', :graffiti => '0', :broken => '0',
             :obi => '1', :smoke => '0', :pet => '0', :mold => '0', :remarks => '帯つきです。少し汚れはありますが読むのに支障はありません。',
             :books_flag => '0', :entry_date => '2014-12-25 00:00:00')


Trade.create(:request_date => '2014-10-10 10:10:10', :receipt_date => '2014-10-12 12:12:12',
              :send_date => '2014-10-19 07:02:15',:complete_date => '2014-10-20 00:12:12', :receipt_members => '1',
              :delivery_members => '2', :books_id => '1', :carriers_id => '1', :tracking_number => '0000000001', :trades_flag => '3')
Trade.create(:request_date => '2014-10-11 10:10:10', :receipt_date => '2014-10-13 12:12:12',
              :send_date => '2014-10-20 07:02:15',:complete_date => '2014-10-21 00:12:12', :receipt_members => '2',
              :delivery_members => '1', :books_id => '2', :carriers_id => '2', :tracking_number => '0000000002', :trades_flag => '2')