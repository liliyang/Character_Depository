require 'test_helper'

class ClutchesControllerTest < ActionController::TestCase
  setup do
    @clutch = clutches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clutches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clutch" do
    assert_difference('Clutch.count') do
      post :create, clutch: { dame: @clutch.dame, date_clutched: @clutch.date_clutched, date_hatched: @clutch.date_hatched, sire: @clutch.sire, userid: @clutch.userid }
    end

    assert_redirected_to clutch_path(assigns(:clutch))
  end

  test "should show clutch" do
    get :show, id: @clutch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clutch
    assert_response :success
  end

  test "should update clutch" do
    patch :update, id: @clutch, clutch: { dame: @clutch.dame, date_clutched: @clutch.date_clutched, date_hatched: @clutch.date_hatched, sire: @clutch.sire, userid: @clutch.userid }
    assert_redirected_to clutch_path(assigns(:clutch))
  end

  test "should destroy clutch" do
    assert_difference('Clutch.count', -1) do
      delete :destroy, id: @clutch
    end

    assert_redirected_to clutches_path
  end
end
