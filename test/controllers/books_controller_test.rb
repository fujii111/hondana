require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { bookinfos_id: @book.bookinfos_id, books_flag: @book.books_flag, broken: @book.broken, entry_date: @book.entry_date, graffiti: @book.graffiti, height: @book.height, members_id: @book.members_id, mold: @book.mold, obi: @book.obi, pet: @book.pet, remarks: @book.remarks, scar: @book.scar, smoke: @book.smoke, state: @book.state, sunburn: @book.sunburn, thick: @book.thick, weight: @book.weight, width: @book.width }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { bookinfos_id: @book.bookinfos_id, books_flag: @book.books_flag, broken: @book.broken, entry_date: @book.entry_date, graffiti: @book.graffiti, height: @book.height, members_id: @book.members_id, mold: @book.mold, obi: @book.obi, pet: @book.pet, remarks: @book.remarks, scar: @book.scar, smoke: @book.smoke, state: @book.state, sunburn: @book.sunburn, thick: @book.thick, weight: @book.weight, width: @book.width }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
