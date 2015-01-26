class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end



  # GET /books/new
  def new
    @book = Book.new
    @book.members_id = session[:id]
    @book.bookinfos_id = session[:bookinofo_id]



    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @member }
    end

  end

  # GET /books/1/edit
  def edit
  end

  def confirm
     @book = Book.new(book_params)
      case @book.state
      when 0 then
        @state = "悪い"
      when 1then
        @state = "普通"
      when 2 then
        @state = "良い"
      when 3 then
        @state = "非常に良い"
      when 4 then
        @state = "ほぼ新品"
      end

      case @book.graffiti
      when 0 then
        @graffiti = "5ページ未満"
      when 1then
        @graffiti = "5ページ以上10ページ未満"
      when 2 then
        @graffiti = "10ページ以上"
      end

      case @book.broken
      when 0 then
        @broken = "5ページ未満"
      when 1then
        @broken = "5ページ以上10ページ未満"
      when 2 then
        @broken = "10ページ以上"
      end


      if @book.sunburn == 1
        @sunburn = "有"
      else
        @sunburn = "無"
      end

      if @book.scar == 1
        @scar = "有"
      else
        @scar = "無"
      end

      if @book.obi == 1
        @obi = "有"
      else
        @obi = "無"
      end

      if @book.smoke == 1
        @smoke = "有"
      else
        @smoke = "無"
      end

      if @book.pet == 1
        @pet = "有"
      else
        @pet = "無"
      end

      if @book.mold == 1
        @mold = "有"
      else
        @mold = "無"
      end

    respond_to do |format|
      if @book.valid?
          # 確認画面
          format.html

      else
          # エラー
          format.html { render :action => "new" }
      end
    end
  end

  def complete
    @book = Book.new(book_params)


      if @book.save
        member = Member.find_by(id: session[:id])
        member.update_attribute(:point,member.point+1)
        render 'top/index'
      else
        format.html { render :action => "new" }
      end

  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        #member = Member.find_by(id: session[:id])
        #member.update_attribute(:point,member.point+1)
        format.html { redirect_to controller: :search,action: :index, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }

      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:members_id, :bookinfos_id, :height, :width, :thick, :weight, :state, :sunburn, :scar, :graffiti, :broken, :obi, :smoke, :pet, :mold, :remarks, :books_flag)
    end
end
