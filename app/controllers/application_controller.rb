class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # ken_test
  # fujii111_test#
  # aica_suzuki
  # hskrk_test
  # tog_test!
  # kosawa
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :checkd_chk
  def checkd_chk(val)
   if val==1
     return 'checked="checked"'
   end
  end


end
