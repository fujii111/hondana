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

    if @param[:picture].class == String then
      session[:pictureflag] = 0
      session[:url] = @param[:picture]
      @param[:picture] = File.basename(@param[:picture]).split("?")[0]
    else
      @image = params[:prof][:picture]

      if @image == nil then
        session[:pictureflag] = 2
        @param.picture = "noimage.jpg"
      else
        session[:pictureflag] = 1
        @param.picture = @image.original_filename
        data=params[:bookinfo]
        File.open('./tmp/'+ data[:picture].original_filename, 'wb') do |of|
          of.write(data[:picture].read)
        end
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
    else
      redirect_to({action: :edit, id: params[:prof][:bookinfos_id]}, notice: 'error')
    end
  end

  def complete
  end
end
