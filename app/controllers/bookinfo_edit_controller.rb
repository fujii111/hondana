class BookinfoEditController < ApplicationController
  def edit
    if cookies[:id].nil? then
      redirect_to "/signin/"
    else
      @b_info = Bookinfo.find(params[:id])
    end
  end

  def confirm
    @param = params[:prof]
    session[:prof] = @param

    @image = params[:prof][:picture]
    if @image.nil? then
        session[:pictureflag] = 0
        @param[:picture] = "noimage.jpg"
    else
      session[:pictureflag] = 1
      @param[:picture] = @image.original_filename
      data = @image
      File.open('./tmp/'+ data.original_filename, 'wb') do |of|
        of.write(data.read)
      end
    end

    if @param[:name] != "" && @param[:author] != "" && @param[:publish] != ""
      if @param[:content] == "" then
        @param[:content] = "作品概要がありません。"
      end

      if @param[:release] == "" then
        @param[:release] = "不明"
      end

      if @param[:isbn] == "" then
        @param[:isbn] = "不明"
      end
      if @param[:picture].nil? then
        @param[:picture] = "なし"
      end
    else
      redirect_to({action: :edit, id: params[:prof][:bookinfos_id]}, notice: 'error')
    end
  end

  def complete
    @param = session[:prof]
    @b_info = Bookinfo.find(@param[:bookinfos_id])
    @b_info.update(name:@param[:name], author:@param[:author], publisher:@param[:publish], release_date:@param[:release], isbn13:@param[:isbn], content:@param[:content])

    if session[:pictureflag] == 1 then
      # ready filepath
      fileName = @param[:picture]
      dirName = "app/assets/images/"
      filePath = dirName + @param[:isbn] + File.extname(fileName)
      File.rename './tmp/' + fileName, filePath
      @param[:picture] = @param[:isbn] + File.extname(fileName)
    end
    @b_info.update(picture: @param[:picture])

    redirect_to({controller: :bookinfos, action: :index }, notice: 'complete')
  end
end
