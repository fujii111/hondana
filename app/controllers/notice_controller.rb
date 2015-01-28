class NoticeController < ApplicationController
  def index
    #if cookies[:remember_token].nil?
    if session[:id].nil?
      redirect_to "/signin/"
    else
      @notice = Notice.where(members_id: session[:id]).order(created_at: :desc)
    end
  end
end
