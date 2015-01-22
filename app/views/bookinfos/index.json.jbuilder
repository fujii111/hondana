json.array!(@bookinfos) do |bookinfo|
  json.extract! bookinfo, :id, :name, :publisher, :author, :release_date, :isbn13, :content, :picture
  json.url bookinfo_url(bookinfo, format: :json)
end
