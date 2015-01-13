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

Member.create(:id => '0', :login_id => 'naoya_god', :name => '鈴木直哉', :kana => 'スズキナオヤ', :birthday => '1993-05-10', :password_digest => 'hfshihgI25235hSGsBgsiD',
              :nickname => 'ナオヤ', :mail_address => 'naoya@google.com', :address => '秋田県秋田市あああ', :point => '10', :quit => '0', :remember_token => '111')
Member.create(:id => '1', :login_id => 'taro_test', :name => '佐藤太郎', :kana => 'サトウタロウ', :birthday => '1962-11-01', :password_digest => 'sigoHIGHOOIg5w553hIOGgs',
              :nickname => 'タロちゃん', :mail_address => 'taro@yahoo.co.jp', :address => '秋田県秋田市いいい', :point => '2', :quit => '0', :remember_token => '222')
Member.create(:id => '2', :login_id => 'ziro_sample', :name => '高橋次郎', :kana => 'タカハシジロウ', :birthday => '2001-01-30', :password_digest => 'sioGHSOIEGhSg87h5h3hhF',
              :nickname => 'らーめんじろう', :mail_address => 'ziro@hotmail.com', :address => '北海道札幌市あああ', :point => '5', :quit => '1', :remember_token => '333')

Book.create(:id => '0', :members_id => '0', :bookinfos_id => '1', :height => '10.0',:width => '20.0', :thick => '15.0',
             :weight => '50', :state => '3', :sunburn => '0', :scar => '0', :graffiti => '0', :broken => '0',
             :obi => '1', :smoke => '0', :pet => '0', :mold => '0', :remarks => '帯つきです。少し汚れはありますが読むのに支障はありません。',
             :books_flag => '0', :entry_date => '2014-12-25 00:00:00')
Book.create(:id => '1', :members_id => '1', :bookinfos_id => '1', :height => '100.0',:width => '200.0', :thick => '150.0',
             :weight => '500', :state => '1', :sunburn => '1', :scar => '0', :graffiti => '1', :broken => '0',
             :obi => '0', :smoke => '0', :pet => '0', :mold => '1', :remarks => 'すごくいいです。',
             :books_flag => '1', :entry_date => '2015-12-25 00:00:00')
Book.create(:id => '2', :members_id => '1', :bookinfos_id => '0', :height => '1000.0',:width => '2000.0', :thick => '1500.0',
             :weight => '5000', :state => '2', :sunburn => '0', :scar => '1', :graffiti => '0', :broken => '1',
             :obi => '0', :smoke => '1', :pet => '1', :mold => '0', :remarks => '',
             :books_flag => '0', :entry_date => '2016-12-25 00:00:00')

Trade.create(:id => '0', :request_date => '2014-10-10 10:10:10', :receipt_date => '2014-10-12 12:12:12',
              :send_date => '2014-10-19 07:02:15',:complete_date => '2014-10-20 00:12:12', :receipt_members => '1',
              :delivery_members => '2', :books_id => '0', :carriers_id => '1', :tracking_number => '0000000001', :trades_flag => '3')
Trade.create(:id => '1', :request_date => '2014-10-11 10:10:10', :receipt_date => '2014-10-13 12:12:12',
              :send_date => '2014-10-20 07:02:15',:complete_date => '2014-10-21 00:12:12', :receipt_members => '2',
              :delivery_members => '1', :books_id => '1', :carriers_id => '2', :tracking_number => '0000000002', :trades_flag => '2')
