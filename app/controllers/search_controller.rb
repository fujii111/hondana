class SearchController < ApplicationController
  def details
    
  end

  def index
     
    @keyword = params['keyword']
    httpClient = HTTPClient.new

    @jsonData = nil
    @errorMeg = nil
    
    @bookinfo = Bookinfo.where(name: '書籍').select(:name)
    
    
    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522', {
          'applicationId' => '1029724767561681573',
          'affiliateId'   => '12169043.4164998a.12169044.3519539e',
          'format'        => 'json',
          'elements'      => 'count,page,first,last,pageCount,title,author,publisherName,isbn,itemCaption,salesDate,itemUrl,mediumImageUrl,booksGenreName',
          'title'         => @keyword,
          'hits'          => '10',
      })
      @jsonData = JSON.parse data
      p @jsonData
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end

    render 'search/index'
  end
end