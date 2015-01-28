class PwForgetController < ApplicationController
  def comp
    @mail_address = params['mail_address']
    member = Member.find_by(mail_address: @mail_address)
    #@mail = MemberMailer.pw_new(member).deliver
    @mail = MemberMailer.pw_new(member)
    @mail.transport_encoding = "8bit"
    @mail.deliver
    render 'pw_forget/comp'
  end
end
