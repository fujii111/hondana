class SessionsController < ApplicationController
  def new

  end

  def create
    member = Member.find_by(login_id: params[:session][:login_id].downcase)
    if member && member.authenticate(params[:session][:password])
      #session[:login_flag] = 1
      sign_in member
      redirect_to root_url
    else
      flash.now[:error] = 'ログインIDまたはパスワードが誤っています。' # 誤りあり!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
