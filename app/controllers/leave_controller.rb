class LeaveController < ApplicationController

  def set_member
      @member = Member.find(params[:id])
    end

  def success

    @quit = member.find_by_sql('update members set quit="true" where id="@member"')
  end
end
