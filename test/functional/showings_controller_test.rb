require 'test_helper'

class ShowingsControllerTest < ActionController::TestCase
  setup do
    @showing = showings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showing" do
    assert_difference('Showing.count') do
      post :create, :showing => @showing.attributes
    end

    assert_redirected_to showing_path(assigns(:showing))
  end

  test "should show showing" do
    get :show, :id => @showing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @showing.to_param
    assert_response :success
  end

  test "should update showing" do
    put :update, :id => @showing.to_param, :showing => @showing.attributes
    assert_redirected_to showing_path(assigns(:showing))
  end

  test "should destroy showing" do
    assert_difference('Showing.count', -1) do
      delete :destroy, :id => @showing.to_param
    end

    assert_redirected_to showings_path
  end
end
