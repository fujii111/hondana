class TopController < ApplicationController

  def index
    @new_bookinfos = Bookinfo.order("created_at DESC").limit(5)
  end

end
