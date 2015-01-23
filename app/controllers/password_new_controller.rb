class PasswordNewController < ApplicationController


  def new
  end

  def comp
    @password = params['password']
    @password_confirmation = params['password_confirmation']
  end
end
