require 'test_helper'

class BookgenresControllerTest < ActionController::TestCase
  setup do
    @bookgenre = bookgenres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookgenres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookgenre" do
    assert_difference('Bookgenre.count') do
      post :create, bookgenre: { name: @bookgenre.name, sort: @bookgenre.sort }
    end

    assert_redirected_to bookgenre_path(assigns(:bookgenre))
  end

  test "should show bookgenre" do
    get :show, id: @bookgenre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookgenre
    assert_response :success
  end

  test "should update bookgenre" do
    patch :update, id: @bookgenre, bookgenre: { name: @bookgenre.name, sort: @bookgenre.sort }
    assert_redirected_to bookgenre_path(assigns(:bookgenre))
  end

  test "should destroy bookgenre" do
    assert_difference('Bookgenre.count', -1) do
      delete :destroy, id: @bookgenre
    end

    assert_redirected_to bookgenres_path
  end
end
