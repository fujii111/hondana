class SessionsController < ApplicationController
  def new

  end

  def create
    member = Member.find_by(login_id: params[:session][:login_id].downcase)
    if member && member.authenticate(params[:session][:password])
      # ユーザーをログインさせ、ユーザーページ (show) にリダイレクトする。
      sign_in member
      redirect_to member
    else
      flash.now[:error] = 'Invalid mail_address/password combination' # 誤りあり!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
