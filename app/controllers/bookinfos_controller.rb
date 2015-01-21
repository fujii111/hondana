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
    @bookinfo = Bookinfo.new
    
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
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end

  end
  
  def confirm
    
    
    
  end

  # GET /bookinfos/1/edit
  def edit
    
  end
    
  # POST /bookinfos
  # POST /bookinfos.json
  def create
    @bookinfo = Bookinfo.new(bookinfo_params)

    respond_to do |format|
      if @bookinfo.save
        format.html { redirect_to @bookinfo, notice: 'Bookinfo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bookinfo }
      else
        format.html { render action: 'new' }
        format.json { render json: @bookinfo.errors, status: :unprocessable_entity }
      end
    end
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
