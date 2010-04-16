require 'test_helper'

class FridgesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fridges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fridge" do
    assert_difference('Fridge.count') do
      post :create, :fridge => { }
    end

    assert_redirected_to fridge_path(assigns(:fridge))
  end

  test "should show fridge" do
    get :show, :id => fridges(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fridges(:one).to_param
    assert_response :success
  end

  test "should update fridge" do
    put :update, :id => fridges(:one).to_param, :fridge => { }
    assert_redirected_to fridge_path(assigns(:fridge))
  end

  test "should destroy fridge" do
    assert_difference('Fridge.count', -1) do
      delete :destroy, :id => fridges(:one).to_param
    end

    assert_redirected_to fridges_path
  end
end
