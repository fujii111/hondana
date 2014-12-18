class SessionsController < ApplicationController
  def new
    member = Member.find_by(mail_address: params[:session][:mail_address].downcase)
    if member && member.authenticate(params[:session][:password])
      # ユーザーをログインさせ、ユーザーページ (show) にリダイレクトする。
      sign_in member
      redirect_to member
    else
      flash[:error] = 'Invalid mail_address/password combination' # 誤りあり!
      render 'new'
    end
  end

  def create
  end

  def destroy
  end
end
