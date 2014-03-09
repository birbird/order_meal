require 'test_helper'

class QuotaControllerTest < ActionController::TestCase
  setup do
    @quotum = quota(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quota)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quotum" do
    assert_difference('Quotum.count') do
      post :create, quotum: { _date: @quotum._date, product_id: @quotum.product_id, quantity: @quotum.quantity }
    end

    assert_redirected_to quotum_path(assigns(:quotum))
  end

  test "should show quotum" do
    get :show, id: @quotum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quotum
    assert_response :success
  end

  test "should update quotum" do
    patch :update, id: @quotum, quotum: { _date: @quotum._date, product_id: @quotum.product_id, quantity: @quotum.quantity }
    assert_redirected_to quotum_path(assigns(:quotum))
  end

  test "should destroy quotum" do
    assert_difference('Quotum.count', -1) do
      delete :destroy, id: @quotum
    end

    assert_redirected_to quota_path
  end
end
