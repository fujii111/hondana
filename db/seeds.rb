# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bookinfo.create(members_id: 1,id: 1, name: '書籍１', publisher: 'A社', author: 'Xさん', langage: '日本語', release_date: '19991010', height: '10', width: '20', thinck: '30', isbn10: '1234567890', isbn13: '1234567890123', content: 'すごい本です。', picture: '20150114.jpg')
Bookinfo.create(members_id: 1,id: 2, name: '書籍２', publisher: 'B社', author: 'Yさん', langage: '英語', release_date: '20000220', height: '15', width: '25', thinck: '35', isbn10: '0987654321', isbn13: '3210987654321', content: 'つよい本です。', picture: '20001221.png')
Bookinfo.create(members_id: 2,id: 3, name: '書籍３', publisher: 'C社', author: 'Zさん', langage: 'ドイツ語', release_date: '20101231', height: '100', width: '200', thinck: '300', isbn10: '1020304050', isbn13: '0102030405060', content: 'よわい本です。', picture: '20130207.gif')
Bookinfo.create(members_id: 2,id: 4, name: '人間失格', publisher: '××××社', author: '太宰治', langage: '日本語',
                 release_date: '20100101', height: '50', width: '30', thinck: '40', isbn10: '1234567891', isbn13: '1234567890121',
                 content: '自殺未遂、薬品中毒…。3枚の奇怪な写真とともに渡された睡眠薬中毒者の手記に、克明に描かれた陰惨な半生…。太宰治の自伝であり、遺書でもある作品。(解説・小林広一/鑑賞・太田治子)', picture: '20150115.jpg')

# coding: utf-8

#Member.create(:login_id => 'naoyagod', :name => '鈴木直哉', :kana => 'スズキナオヤ', :birthday => '1993-05-10', :password_digest => 'hfshihgI25235hSGsBgsiD',
#              :nickname => 'ナオヤ', :mail_address => 'naoya@google.com', :address => '秋田県秋田市あああ', :point => '10', :quit => '0', :remember_token => '111111111111111111111111111111111111')
#Member.create(:login_id => 'tarotest', :name => '佐藤太郎', :kana => 'サトウタロウ', :birthday => '1962-11-01', :password_digest => 'sigoHIGHOOIg5w553hIOGgs',
#              :nickname => 'タロちゃん', :mail_address => 'taro@yahoo.jp', :address => '秋田県秋田市いいい', :point => '2', :quit => '0', :remember_token => '222222222222222222222222222222222222')
#Member.create(:login_id => 'zirosample', :name => '高橋次郎', :kana => 'タカハシジロウ', :birthday => '2001-01-30', :password_digest => 'sioGHSOIEGhSg87h5h3hhF',
#              :nickname => 'らーめんじろう', :mail_address => 'ziro@hotmail.com', :address => '北海道札幌市あああ', :point => '5', :quit => '1', :remember_token => '333333333333333333333333333333333333')

#Book.create(:members_id => '1', :bookinfos_id => '1', :height => '10.0',:width => '20.0', :thick => '15.0',
#             :weight => '50', :state => '3', :sunburn => '0', :scar => '0', :graffiti => '0', :broken => '0',
#             :obi => '1', :smoke => '0', :pet => '0', :mold => '0', :remarks => '1さんの1という本。交換可能。帯つきです。少し汚れはありますが読むのに支障はありません。',
#             :books_flag => '0')
#Book.create(:members_id => '1', :bookinfos_id => '3', :height => '100.0',:width => '200.0', :thick => '150.0',
#             :weight => '500', :state => '1', :sunburn => '1', :scar => '0', :graffiti => '1', :broken => '0',
#             :obi => '0', :smoke => '0', :pet => '0', :mold => '1', :remarks => '1さんの3という本。交換中。',
#             :books_flag => '1')
#Book.create(:members_id => '2', :bookinfos_id => '2', :height => '1000.0',:width => '2000.0', :thick => '1500.0',
#             :weight => '5000', :state => '2', :sunburn => '0', :scar => '1', :graffiti => '0', :broken => '1',
#             :obi => '0', :smoke => '1', :pet => '1', :mold => '0', :remarks => '2さんの2という本。交換可能',
#             :books_flag => '0')
#Book.create(:members_id => '3', :bookinfos_id => '1', :height => '1000.0',:width => '2000.0', :thick => '1500.0',
#             :weight => '5000', :state => '2', :sunburn => '0', :scar => '1', :graffiti => '0', :broken => '1',
#             :obi => '0', :smoke => '1', :pet => '1', :mold => '0', :remarks => '3さんの1という本。交換済み。',
#             :books_flag => '2')
#Book.create(:members_id => '4', :bookinfos_id => '1', :height => '1000.0',:width => '2000.0', :thick => '1500.0',
#             :weight => '5000', :state => '2', :sunburn => '0', :scar => '1', :graffiti => '0', :broken => '1',
#             :obi => '0', :smoke => '1', :pet => '1', :mold => '0', :remarks => '4さんの1という本。交換可能。',
#             :books_flag => '0')

#Trade.create(:request_date => '2014-10-10 10:10:10', :receipt_date => '2014-10-12 12:12:12',
#              :send_date => '2014-10-19 07:02:15',:complete_date => '2014-10-20 00:12:12', :receipt_members => '2',
#              :delivery_members => '1', :books_id => '1', :carriers_id => '1', :tracking_number => '0000000001', :trades_flag => '3')
#Trade.create(:request_date => '2014-10-11 10:10:10', :receipt_date => '2014-10-13 12:12:12',
#              :send_date => '2014-10-20 07:02:15',:complete_date => '2014-10-21 00:12:12', :receipt_members => '2',
#              :delivery_members => '1', :books_id => '2', :carriers_id => '2', :tracking_number => '0000000002', :trades_flag => '2')
#Trade.create(:request_date => '2013-05-13 11:11:11', :receipt_date => '2014-09-13 00:00:01',
#              :send_date => '2014-09-20 07:02:15',:complete_date => '2014-09-21 00:12:12', :receipt_members => '1',
#              :delivery_members => '2', :books_id => '3', :carriers_id => '2', :tracking_number => '0000000003', :trades_flag => '3')

Bookgenre.create([{name: 'genre1', sort: '1'},
                  {name: 'genre2', sort: '2'},
                  {name: 'genre3', sort: '3'},
                  {name: 'genre4', sort: '4'},
                  {name: 'genre5', sort: '5'},
                  {name: 'genre6', sort: '6'},
                  {name: 'genre7', sort: '7'},
                  {name: 'genre8', sort: '8'},
                  {name: 'genre9', sort: '9'},
                  {name: 'genre10', sort: '10'}])

BookinfoGenre.create([{bookinfos_id: '1',bookgenres_id: '2'},
                      {bookinfos_id: '1',bookgenres_id: '4'},
                      {bookinfos_id: '2',bookgenres_id: '6'},
                      {bookinfos_id: '3',bookgenres_id: '8'}])

MembersBooks.create([{members_id: '1', books_id: '1', entry_date: '2199/12/31',sort: '1'},
                     {members_id: '1', books_id: '3', entry_date: '2199/12/30',sort: '2'}])


