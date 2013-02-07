require 'test_helper'

class TipocontratosControllerTest < ActionController::TestCase
  setup do
    @tipocontrato = tipocontratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipocontratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipocontrato" do
    assert_difference('Tipocontrato.count') do
      post :create, tipocontrato: { id: @tipocontrato.id, tpcontrato: @tipocontrato.tpcontrato }
    end

    assert_redirected_to tipocontrato_path(assigns(:tipocontrato))
  end

  test "should show tipocontrato" do
    get :show, id: @tipocontrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipocontrato
    assert_response :success
  end

  test "should update tipocontrato" do
    put :update, id: @tipocontrato, tipocontrato: { id: @tipocontrato.id, tpcontrato: @tipocontrato.tpcontrato }
    assert_redirected_to tipocontrato_path(assigns(:tipocontrato))
  end

  test "should destroy tipocontrato" do
    assert_difference('Tipocontrato.count', -1) do
      delete :destroy, id: @tipocontrato
    end

    assert_redirected_to tipocontratos_path
  end
end
