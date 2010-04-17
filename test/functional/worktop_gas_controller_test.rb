require 'test_helper'

class WorktopGasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worktop_gas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worktop_ga" do
    assert_difference('WorktopGa.count') do
      post :create, :worktop_ga => { }
    end

    assert_redirected_to worktop_ga_path(assigns(:worktop_ga))
  end

  test "should show worktop_ga" do
    get :show, :id => worktop_gas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => worktop_gas(:one).to_param
    assert_response :success
  end

  test "should update worktop_ga" do
    put :update, :id => worktop_gas(:one).to_param, :worktop_ga => { }
    assert_redirected_to worktop_ga_path(assigns(:worktop_ga))
  end

  test "should destroy worktop_ga" do
    assert_difference('WorktopGa.count', -1) do
      delete :destroy, :id => worktop_gas(:one).to_param
    end

    assert_redirected_to worktop_gas_path
  end
end
