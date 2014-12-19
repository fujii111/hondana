class Item
  attr_accessor :asin, :title, :image, :url
  def initialize(asin, title = nil, url = nil, image = nil)
    @asin = asin
    @title = title
    @url = url
    @image = image
  end
end