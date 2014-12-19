class AccountController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper
  def index
  end
end
