class MemberMailer < ActionMailer::Base
  default from: 'k361512@gmail.com'
  def pw_new(member)
    @mamber = member
    mail(to: member.mai_address,subject: 'わわわ')
  end

end
