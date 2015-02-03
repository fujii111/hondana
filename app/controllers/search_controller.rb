class SearchController < ApplicationController
  def book_details
    @bookinfo = Bookinfo.find(params[:id])
    #@book_genre = Bookgenre.find_by_sql(["select bookgenres.name from bookgenres join bookinfo_genres on bookgenres.id = bookinfo_genres.bookgenres_id where bookinfo_genres.bookinfos_id = :id",{:id => params[:id]}])
    session[:bookinfo_id] = @bookinfo.id
    render 'search/book_details'

  end

  def details

  end

  def search_details
    @details_title = params['details_title']
    @details_author = params['details_author']
    @details_isbn = params['details_isbn']
    if @details_isbn =~ /^[0-9]{10}$/ then
      @details_isbn13 = "978" + @details_isbn
    elsif @details_isbn =~ /^[0-9]{13}$/ then
      @details_isbn13 = @details_isbn
    elsif @details_isbn == "" or @details_isbn == nil then
      @details_isbn13 = ""
    else
      @nilKeyword = 3
    end
    @details_publisher = params['details_publisher']


    if @details_title == nil then
      @details_title = session[:details_title]
    else
      session[:details_title] = @details_title
    end
    if @details_author == nil then
      @details_author = session[:details_author]
    else
      session[:details_author] = @details_author
    end
    if @details_isbn == nil then
      @details_isbn = session[:details_isbn]
    else
      session[:details_isbn] = @details_isbn
    end
    if @details_publisher == nil then
      @details_publisher = session[:details_publisher]
    else
      session[:details_publisher] = @details_publisher
    end




    if @details_title == "" or @details_title =~ /^[\s　]+$/ and
       @details_author == "" or @details_author =~ /^[\s　]+$/ and
       @details_isbn == "" or @details_isbn =~ /^[\s　]+$/ and
       @details_publisher == "" or @details_publisher =~ /^[\s　]+$/ then
      @nilKeyword = 0
      render 'search/index' and return

    elsif @details_title =~ /^.$/ or @details_title =~ /^[\s　]*.+[\s　]+.$/ or @details_title =~ /^[\s　]*.[\s　]+.+$/ or
          @details_author =~ /^.$/ or @details_author =~ /^[\s　]*.+[\s　]+.$/ or @details_author =~ /^[\s　]*.[\s　]+.+$/ or
          @details_isbn =~ /^.$/ or @details_isbn =~ /^[\s　]*.+[\s　]+.$/ or @details_isbn =~ /^[\s　]*.[\s　]+.+$/ or
          @details_publisher =~ /^.$/ or @details_publisher =~ /^[\s　]*.+[\s　]+.$/ or @details_publisher =~ /^[\s　]*.[\s　]+.+$/ then
      @nilKeyword = 1
     render 'search/index' and return

    elsif @nilKeyword == 3 then
      render 'search/index' and return

    else
    condition = []
    json_condition = {}

    json_condition['applicationId'] = '1029724767561681573'
    json_condition['affiliateId'] = '12169043.4164998a.12169044.3519539e'
    json_condition['format'] = 'json'
    json_condition['elements'] = 'count,page,first,last,pageCount,title,author,publisherName,size,isbn,itemCaption,salesDate,itemUrl,mediumImageUrl,booksGenreName'

    if @details_title != nil and @details_title != "" then
      condition.append("name like '%" + @details_title + "%'")
      json_condition['title'] = @details_title
    end
    if @details_author != nil and @details_author != "" then
      condition.append("author like '%" + @details_author + "%'")
      json_condition['author'] = @details_author
    end
    if @details_isbn13 != nil and @details_isbn13 != "" then
      condition.append("isbn13 like " + @details_isbn13)
      json_condition['isbn'] = @details_isbn13
    end
    if @details_publisher != nil and @details_publisher != "" then
      condition.append("publisher like '%" + @details_publisher + "%'")
      json_condition['publisherName'] = @details_publisher
    end

    json_condition['hits'] = '10'

    sql_condition = condition.join(" and ")

    @bookinfo = Bookinfo.where(sql_condition)


    @keyword_details = "タイトル : " + @details_title + "
                                                       著者名　 : " + @details_author + "
                                                       ＩＳＢＮ : " + @details_isbn + "
                                                       出版社　 : " + @details_publisher

    httpClient = HTTPClient.new

      @jsonData = nil
      @errorMeg = nil

      @nilKeyword = 2

        begin
          data = httpClient.get_content('https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522', json_condition)

        @jsonData = JSON.parse data
        p @jsonData
        rescue HTTPClient::BadResponseError => e
        rescue HTTPClient::TimeoutError => e
      end
      session[:details_flag] = "0"
      render 'search/index'
      end
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
      return 'search/index'
    elsif @keyword =~ /^.$/ or @keyword =~ /^[\s　]*.+[\s　]+.$/ or @keyword =~ /^[\s　]*.[\s　]+.+$/ then
      @nilKeyword = 1
      return 'search/index'
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
    session[:details_flag] = "1"
    render 'search/index'
    end
  end
end