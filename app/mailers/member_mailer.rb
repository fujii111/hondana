class MemberMailer < ActionMailer::Base
  default from: 'webmaster@wings.msn.to',
          cc: 'CQW15204@nifty.com'
  def pw_new(member)
    @mamber = member
    mail(to: member.mail_address,subject: 'わわわ')
  end

end
