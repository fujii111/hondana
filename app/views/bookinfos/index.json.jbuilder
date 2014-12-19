json.array!(@bookinfos) do |bookinfo|
  json.extract! bookinfo, :id, :name, :publisher, :author, :langage, :release_date, :height, :width, :thinck, :isbn10, :isbn13, :content, :picture
  json.url bookinfo_url(bookinfo, format: :json)
end
