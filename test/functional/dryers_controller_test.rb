require 'test_helper'

class DryersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dryers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dryer" do
    assert_difference('Dryer.count') do
      post :create, :dryer => { }
    end

    assert_redirected_to dryer_path(assigns(:dryer))
  end

  test "should show dryer" do
    get :show, :id => dryers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dryers(:one).to_param
    assert_response :success
  end

  test "should update dryer" do
    put :update, :id => dryers(:one).to_param, :dryer => { }
    assert_redirected_to dryer_path(assigns(:dryer))
  end

  test "should destroy dryer" do
    assert_difference('Dryer.count', -1) do
      delete :destroy, :id => dryers(:one).to_param
    end

    assert_redirected_to dryers_path
  end
end
