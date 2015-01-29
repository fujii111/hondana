class SearchController < ApplicationController
  def book_details
    session[:entry_books] = nil
    @bookinfo = Bookinfo.find(params[:id])
    @book_genre = Bookgenre.find_by_sql(["select bookgenres.name from bookgenres join bookinfo_genres on bookgenres.id = bookinfo_genres.bookgenres_id where bookinfo_genres.bookinfos_id = :id",{:id => params[:id]}])
    session[:bookinofo_id] = @bookinfo.id
    render 'search/book_details'

  end

  def details
    
  end  
     
  def search_details
    @details_title = params['details_title']
    @details_author = params['details_author']
    @details_isbn = params['details_isbn']
    @details_publisher = params['details_publisher']
    
    #@bookinfo = Bookinfo.where("name like '%" + @details_title + "%' and author like '%" + @details_author + "%' and isbn13: @details_isbn and publisher like '%" + @details_publisher + "%'")
    @bookinfo = Bookinfo.where(name: @details_name)
    
    @keyword_details = "タイトル : " + @details_title + "
                                                       著者名　 : " + @details_author + "
                                                       ＩＳＢＮ : " + @details_isbn + "
                                                       出版社　 : " + @details_publisher
    
    httpClient = HTTPClient.new
  
      @jsonData = nil
      @errorMeg = nil     
  
      @nilKeyword = 2


        begin
          data = httpClient.get_content('https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522', {
              'applicationId' => '1029724767561681573',
              'affiliateId'   => '12169043.4164998a.12169044.3519539e',
              'format'        => 'json',
              'elements'      => 'count,page,first,last,pageCount,title,author,publisherName,size,isbn,itemCaption,salesDate,itemUrl,mediumImageUrl,booksGenreName',
              'title'         => @details_title,
              #'author'        => @details_author,
              #'isbn'          => @details_isbn,
              #'publisherName' => @details_publisher,
              'hits'          => '10'
          })

        @jsonData = JSON.parse data
        p @jsonData
        rescue HTTPClient::BadResponseError => e
        rescue HTTPClient::TimeoutError => e
      end
      render 'search/index'
    end


  def index

    @keyword = params['keyword']
    if @keyword == nil then
      @keyword = session[:keyword]
    else
      session[:keyword] = @keyword
    end 
    
    
    if @keyword == "" or @keyword =~ /^[\s　]+$/ then
      @nilKeyword = 0
      return
    elsif @keyword =~ /^.$/ or @keyword =~ /^[\s　]*.+[\s　]+.$/ or @keyword =~ /^[\s　]*.[\s　]+.+$/ then
      @nilKeyword = 1
      return
    else
      
      httpClient = HTTPClient.new
  
      @jsonData = nil
      @errorMeg = nil
      
      @bookinfo = Bookinfo.where("name like '%" + @keyword + "%' or author like '%" + @keyword + "%'")
      
  
      @nilKeyword = 2

        begin
          data = httpClient.get_content('https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522', {
              'applicationId' => '1029724767561681573',
              'affiliateId'   => '12169043.4164998a.12169044.3519539e',
              'format'        => 'json',
              'elements'      => 'count,page,first,last,pageCount,title,author,publisherName,size,isbn,itemCaption,salesDate,itemUrl,mediumImageUrl,booksGenreName',
              'title'         => @keyword,
              'hits'          => '10'
          })

        
        @jsonData = JSON.parse data
        p @jsonData
     rescue HTTPClient::BadResponseError => e
     rescue HTTPClient::TimeoutError => e
    end
    render 'search/index'
    end
  end
end