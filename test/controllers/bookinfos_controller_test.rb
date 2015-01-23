require 'test_helper'

class BookinfosControllerTest < ActionController::TestCase
  setup do
    @bookinfo = bookinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookinfo" do
    assert_difference('Bookinfo.count') do
      post :create, bookinfo: { author: @bookinfo.author, content: @bookinfo.content, height: @bookinfo.height, isbn10: @bookinfo.isbn10, isbn13: @bookinfo.isbn13, langage: @bookinfo.langage, name: @bookinfo.name, picture: @bookinfo.picture, publisher: @bookinfo.publisher, ralease_date: @bookinfo.ralease_date, thinck: @bookinfo.thinck, width: @bookinfo.width }
    end

    assert_redirected_to bookinfo_path(assigns(:bookinfo))
  end

  test "should show bookinfo" do
    get :show, id: @bookinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookinfo
    assert_response :success
  end

  test "should update bookinfo" do
    patch :update, id: @bookinfo, bookinfo: { author: @bookinfo.author, content: @bookinfo.content, height: @bookinfo.height, isbn10: @bookinfo.isbn10, isbn13: @bookinfo.isbn13, langage: @bookinfo.langage, name: @bookinfo.name, picture: @bookinfo.picture, publisher: @bookinfo.publisher, ralease_date: @bookinfo.ralease_date, thinck: @bookinfo.thinck, width: @bookinfo.width }
    assert_redirected_to bookinfo_path(assigns(:bookinfo))
  end

  test "should destroy bookinfo" do
    assert_difference('Bookinfo.count', -1) do
      delete :destroy, id: @bookinfo
    end

    assert_redirected_to bookinfos_path
  end

  class TformController < ApplicationController
  def act1
    file=params[:file]['htmldata']
    @filename = params[:file]['htmldata'].original_filename
    File.open("public/#{@filename}",
   "wb"){ |f| f.write(file.read) }
  end

    def upload
    file = params[:picture]
    name = file.original_filename

    File.open("public/img/#{name}", 'wb') { |f|
      f.write(file.read)
    }

    render nothing: true, status: 200
  end

end
end
