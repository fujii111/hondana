class SamplesController < ApplicationController
  def index2
    file = params[:uppic]

    name = file.original_filename
    if !['.pdf'].include?(File.extname(name).downcase)
      msg = 'アップロードできるのは.pdfだけ'
      render :text => msg
    elsif file.size > 10.megabyte
      msg = 'アップロードは10メガバイトまで'
      render :text => msg
    else
      #name = name.kconv(Kconv::SJIS, Kconv::UTF8)
      File.open("tmp/clickpost/#{name}", 'wb') { |f| f.write(file.read) }
    end
  end

end