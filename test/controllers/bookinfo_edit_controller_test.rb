require 'test_helper'

class BookinfoEditControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get complete" do
    get :complete
    assert_response :success
  end

end
