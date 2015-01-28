require 'test_helper'

class ModelsControllerTest < ActionController::TestCase
  setup do
    @model = models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model" do
    assert_difference('Model.count') do
      post :create, model: { author: @model.author, bookinfo: @model.bookinfo, content: @model.content, height: @model.height, isbn10: @model.isbn10, isbn13: @model.isbn13, langage: @model.langage, name: @model.name, picture: @model.picture, publisher: @model.publisher, release_date: @model.release_date, thinck: @model.thinck, width: @model.width }
    end

    assert_redirected_to model_path(assigns(:model))
  end

  test "should show model" do
    get :show, id: @model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model
    assert_response :success
  end

  test "should update model" do
    patch :update, id: @model, model: { author: @model.author, bookinfo: @model.bookinfo, content: @model.content, height: @model.height, isbn10: @model.isbn10, isbn13: @model.isbn13, langage: @model.langage, name: @model.name, picture: @model.picture, publisher: @model.publisher, release_date: @model.release_date, thinck: @model.thinck, width: @model.width }
    assert_redirected_to model_path(assigns(:model))
  end

  test "should destroy model" do
    assert_difference('Model.count', -1) do
      delete :destroy, id: @model
    end

    assert_redirected_to models_path
  end
end
