class SessionsController < ApplicationController
  def new

  end

  def create
    member = Member.find_by(login_id: params[:session][:login_id].downcase)
    if member && member.authenticate(params[:session][:password])
      #if (member.quit === 1)
        session[:id] = member.id
        sign_in member
        redirect_to root_url
      #else
        #flash.now[:error] = 'ログインIDまたはパスワードが誤っています。' # 誤りあり!
     # end
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
