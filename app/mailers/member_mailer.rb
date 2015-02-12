class MemberMailer < ActionMailer::Base
  default from: 'webmaster@wings.msn.to',
          cc: 'CQW15204@nifty.com'
  def pw_new(member)

    if member != nil then
      @member = member
      @id = @member.id
      #mail(to: member.mail_address,subject: 'わわわ', content_transfer_encoding:  '8bit',)
     mail(:to => member.mail_address,
         :content_transfer_encoding => '8bit',
         :subject => I18n.t("パスワード再設定"))

    end

  end

end
