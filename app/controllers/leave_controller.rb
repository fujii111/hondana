class LeaveController < ApplicationController

  def success
    member = Member.find_by(id: cookies[:id])
    member.update_attribute(:quit,1)
    cookies.delete(:remember_token)
  end
end