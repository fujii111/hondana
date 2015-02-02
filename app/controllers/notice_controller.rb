class NoticeController < ApplicationController
  def index
    #if cookies[:remember_token].nil?
    if cookies[:id].nil?
      redirect_to "/signin/"
    else
      @notice = Notice.where(members_id: cookies[:id].to_i).order(created_at: :desc)

    end
  end

  def read
    @notice = Notice.find(params[:id])
    @notice.read_flag = 1
    @notice.save
    render text: "true"
  end
end
