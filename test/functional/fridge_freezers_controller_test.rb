require 'test_helper'

class FridgeFreezersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fridge_freezers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fridge_freezer" do
    assert_difference('FridgeFreezer.count') do
      post :create, :fridge_freezer => { }
    end

    assert_redirected_to fridge_freezer_path(assigns(:fridge_freezer))
  end

  test "should show fridge_freezer" do
    get :show, :id => fridge_freezers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fridge_freezers(:one).to_param
    assert_response :success
  end

  test "should update fridge_freezer" do
    put :update, :id => fridge_freezers(:one).to_param, :fridge_freezer => { }
    assert_redirected_to fridge_freezer_path(assigns(:fridge_freezer))
  end

  test "should destroy fridge_freezer" do
    assert_difference('FridgeFreezer.count', -1) do
      delete :destroy, :id => fridge_freezers(:one).to_param
    end

    assert_redirected_to fridge_freezers_path
  end
end
