require 'test_helper'

class DishwashersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dishwashers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dishwasher" do
    assert_difference('Dishwasher.count') do
      post :create, :dishwasher => { }
    end

    assert_redirected_to dishwasher_path(assigns(:dishwasher))
  end

  test "should show dishwasher" do
    get :show, :id => dishwashers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dishwashers(:one).to_param
    assert_response :success
  end

  test "should update dishwasher" do
    put :update, :id => dishwashers(:one).to_param, :dishwasher => { }
    assert_redirected_to dishwasher_path(assigns(:dishwasher))
  end

  test "should destroy dishwasher" do
    assert_difference('Dishwasher.count', -1) do
      delete :destroy, :id => dishwashers(:one).to_param
    end

    assert_redirected_to dishwashers_path
  end
end
