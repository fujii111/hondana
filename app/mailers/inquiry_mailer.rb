class InquiryMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.sendmail_confirm.subject
  #
  
  def comp_confirm(category, content, name, kana, mail)
    mail(from: mail, to: "example@spicatravel.org", subject: category)
    @content = content
    @name = name
    @kana = kana
  end
end
