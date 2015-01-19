json.array!(@books) do |book|
  json.extract! book, :id, :members_id, :bookinfos_id, :height, :width, :thick, :weight, :state, :sunburn, :scar, :graffiti, :broken, :obi, :smoke, :pet, :mold, :remarks, :books_flag, :entry_date
  json.url book_url(book, format: :json)
end
