class PwForgetController < ApplicationController
  def comp
    @mail_address = params['mail_address']
    member = Member.find_by(:mail_address => @mail_address)
    @mail = MemberMailer.pw_new(member).deliver
    #render text: 'メールが正しく送信できました'
  end
end
