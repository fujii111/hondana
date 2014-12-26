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