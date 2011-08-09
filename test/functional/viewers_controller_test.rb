require 'test_helper'

class ViewersControllerTest < ActionController::TestCase
  setup do
    @viewer = viewers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viewers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viewer" do
    assert_difference('Viewer.count') do
      post :create, :viewer => @viewer.attributes
    end

    assert_redirected_to viewer_path(assigns(:viewer))
  end

  test "should show viewer" do
    get :show, :id => @viewer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @viewer.to_param
    assert_response :success
  end

  test "should update viewer" do
    put :update, :id => @viewer.to_param, :viewer => @viewer.attributes
    assert_redirected_to viewer_path(assigns(:viewer))
  end

  test "should destroy viewer" do
    assert_difference('Viewer.count', -1) do
      delete :destroy, :id => @viewer.to_param
    end

    assert_redirected_to viewers_path
  end
end
