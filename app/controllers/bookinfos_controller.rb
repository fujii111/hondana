class BookinfosController < ApplicationController
  before_action :set_bookinfo, only: [:show, :edit, :update, :destroy]

  # GET /bookinfos
  # GET /bookinfos.json
  def index
    @bookinfos = Bookinfo.all

  end

  # GET /bookinfos/1
  # GET /bookinfos/1.json
  def show
  end

  # GET /bookinfos/new
  def new
    if params[:bookinfo] == nil then
      @bookinfo = Bookinfo.new
    else
      @bookinfo = Bookinfo.new(bookinfo_params)
    end
    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render :json => @member }
    #end

    @keyword = params[:keyword]
    if params[:entryflag] != nil then
      session[:entryflag] = params[:entryflag]
    end

    if session[:entryflag] == "1" then
      @searchIsbn = params[:isbn]

      httpClient = HTTPClient.new

      @entryData = nil
      @errorMeg = nil

      begin
        entrydata = httpClient.get_content('https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522', {
            'applicationId' => '1029724767561681573',
            'affiliateId'   => '12169043.4164998a.12169044.3519539e',
            'format'        => 'json',
            'elements'      => 'title,author,publisherName,isbn,itemCaption,salesDate,mediumImageUrl',
            'isbn'          => @searchIsbn,
        })
        @entryData = JSON.parse entrydata
        p @entryData
        session[:entryjson] = @entryData
      rescue HTTPClient::BadResponseError => e
      rescue HTTPClient::TimeoutError => e
      end

    elsif session[:entryflag] == "0" then

    end

  end

  def confirm
    @bookinfo = Bookinfo.new(bookinfo_params)
    respond_to do |format|

          if @bookinfo.picture.class == String then
            session[:pictureflag] = 0
            session[:url] = @bookinfo.picture
            @bookinfo.picture = File.basename(@bookinfo.picture).split("?")[0]
          else
              @image = params[:bookinfo][:picture]
            if @image == nil then
              session[:pictureflag] = 2
              @bookinfo.picture = "noimage.jpg"
            else
              session[:pictureflag] = 1
              @bookinfo.picture = @image.original_filename
              data=params[:bookinfo]
              File.open('./tmp/'+ data[:picture].original_filename, 'wb') do |of|
                of.write(data[:picture].read)
              end
            end
          end

      if @bookinfo.valid?
          if @bookinfo.content == "" then
            @bookinfo.content = "作品概要がありません。"
          end
          # 確認画面
          format.html
      else
          # エラー
          format.html { render :action => "new", :isbn => @searchIsbn, :keyword => @keyword }
      end
    end
  end

    def complete
      @bookinfo = Bookinfo.new(bookinfo_params)
      if @bookinfo.save
          if session[:pictureflag] == 0 then
            # ready filepath
            fileName = File.basename(session[:url]).split("?")[0]
            dirName = "app/assets/images/"
            filePath = dirName + fileName

            # write image adata
            open(filePath, 'wb') do |output|
              open(session[:url]) do |data|
                output.write(data.read)
              end
            end

          elsif session[:pictureflag] == 1 then
            # ready filepath
            fileName = @bookinfo.picture
            dirName = "app/assets/images/"
            filePath = dirName + @bookinfo.isbn13 + File.extname(fileName)
            File.rename './tmp/' + fileName, filePath
            @bookinfo.picture = @bookinfo.isbn13 + File.extname(fileName)
            @bookinfo.save
          end

          render "top/index"
      else
        format.html { render :action => "new" }
      end
    end
  # GET /bookinfos/1/edit
  def edit

  end

  # POST /bookinfos
  # POST /bookinfos.json
  def create
    @bookinfo = Bookinfo.new(bookinfo_params)

    #respond_to do |format|
      #if @bookinfo.save
       #format.html { redirect_to @bookinfo, notice: 'Bookinfo was successfully created.' }
       #format.json { render action: 'show', status: :created, location: @bookinfo }
      #else
       #format.html { render action: 'new' }
       #format.json { render json: @bookinfo.errors, status: :unprocessable_entity }
      #end
    #end

  end

  # PATCH/PUT /bookinfos/1
  # PATCH/PUT /bookinfos/1.json
  def update
    respond_to do |format|
      if @bookinfo.update(bookinfo_params)
        format.html { redirect_to @bookinfo, notice: 'Bookinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookinfos/1
  # DELETE /bookinfos/1.json
  def destroy
    @bookinfo.destroy
    respond_to do |format|
      format.html { redirect_to bookinfos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookinfo
      @bookinfo = Bookinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookinfo_params
      params.require(:bookinfo).permit(:name, :publisher, :author, :langage, :release_date, :height, :width, :thinck, :isbn10, :isbn13, :content, :picture)
    end
end
