class LeaveController < ApplicationController

  def success
    member = Member.find()
    member.update_attribute(:quit,1 )
  end
end