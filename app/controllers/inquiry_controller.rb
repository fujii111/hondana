class InquiryController < ApplicationController
    
  def index
    
  end  
  
  def confirm
        
    error_flg = false
    if params[:inquiry_category] == "未選択" then
      flash.now[:error1] = "カテゴリを選択して下さい。"
      error_flg = true
    else
      @inquiry_category = params[:inquiry_category]
    end
    
    if params[:inquiry_content] == "" then
      flash.now[:error2] = "お問い合せ内容を入力して下さい。"
      error_flg = true
    else
      @inquiry_content = params[:inquiry_content]
    end
    
    if params[:inquiry_name] == "" then
      flash.now[:error3] = "お名前を入力して下さい。"
      error_flg = true
    else
      @inquiry_name = params[:inquiry_name]
    end
    
    if params[:inquiry_kana] == "" then
      flash.now[:error4] = "フリガナを入力して下さい。"
      error_flg = true
    elsif params[:inquiry_kana] =~ /\A([ァ-ヴ]|[ー－])+\Z/ then
      @inquiry_kana = params[:inquiry_kana]
    else
      flash.now[:error4] = "フリガナは全角カナで入力して下さい。"
      error_flg = true
    end
    
    if params[:inquiry_mail] == "" then
      flash.now[:error5] = "メールアドレスを入力して下さい。"
      error_flg = true
    elsif params[:inquiry_mail] =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/ then
      @inquiry_mail = params[:inquiry_mail]
    else
      flash.now[:error5] = "メールアドレスを正しく入力して下さい。"
      error_flg = true
    end
    
    if error_flg then
      render 'inquiry/index'
    else
      render 'inquiry/confirm'
    end
  end
  
  def comp
    
    category = params[:inquiry_category]
    content = params[:inquiry_content]
    name = params[:inquiry_name]
    kana = params[:inquiry_kana]
    mail = params[:inquiry_mail]
    
        
    @mail = InquiryMailer.comp_confirm(category, content, name, kana, mail)
    @mail.transport_encoding = '8bit'
    @mail.deliver

    render 'inquiry/comp' 
    
  end
  
end
