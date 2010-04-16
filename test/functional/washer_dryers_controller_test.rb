require 'test_helper'

class WasherDryersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:washer_dryers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create washer_dryer" do
    assert_difference('WasherDryer.count') do
      post :create, :washer_dryer => { }
    end

    assert_redirected_to washer_dryer_path(assigns(:washer_dryer))
  end

  test "should show washer_dryer" do
    get :show, :id => washer_dryers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => washer_dryers(:one).to_param
    assert_response :success
  end

  test "should update washer_dryer" do
    put :update, :id => washer_dryers(:one).to_param, :washer_dryer => { }
    assert_redirected_to washer_dryer_path(assigns(:washer_dryer))
  end

  test "should destroy washer_dryer" do
    assert_difference('WasherDryer.count', -1) do
      delete :destroy, :id => washer_dryers(:one).to_param
    end

    assert_redirected_to washer_dryers_path
  end
end
