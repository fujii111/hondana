class InquiryMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.sendmail_confirm.subject
  #

  def sendmail_confirm
    mail(from: @inquiry_mail, to: "to@spicatravel.org", subject: @inquiry_category)
  end
end
