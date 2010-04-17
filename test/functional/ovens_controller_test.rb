require 'test_helper'

class OvensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ovens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oven" do
    assert_difference('Oven.count') do
      post :create, :oven => { }
    end

    assert_redirected_to oven_path(assigns(:oven))
  end

  test "should show oven" do
    get :show, :id => ovens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ovens(:one).to_param
    assert_response :success
  end

  test "should update oven" do
    put :update, :id => ovens(:one).to_param, :oven => { }
    assert_redirected_to oven_path(assigns(:oven))
  end

  test "should destroy oven" do
    assert_difference('Oven.count', -1) do
      delete :destroy, :id => ovens(:one).to_param
    end

    assert_redirected_to ovens_path
  end
end
