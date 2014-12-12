json.array!(@bookgenres) do |bookgenre|
  json.extract! bookgenre, :id, :name, :sort
  json.url bookgenre_url(bookgenre, format: :json)
end
