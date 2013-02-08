require 'test_helper'

class TipoContratosControllerTest < ActionController::TestCase
  setup do
    @tipo_contrato = tipo_contratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_contratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_contrato" do
    assert_difference('TipoContrato.count') do
      post :create, tipo_contrato: { tipo: @tipo_contrato.tipo }
    end

    assert_redirected_to tipo_contrato_path(assigns(:tipo_contrato))
  end

  test "should show tipo_contrato" do
    get :show, id: @tipo_contrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_contrato
    assert_response :success
  end

  test "should update tipo_contrato" do
    put :update, id: @tipo_contrato, tipo_contrato: { tipo: @tipo_contrato.tipo }
    assert_redirected_to tipo_contrato_path(assigns(:tipo_contrato))
  end

  test "should destroy tipo_contrato" do
    assert_difference('TipoContrato.count', -1) do
      delete :destroy, id: @tipo_contrato
    end

    assert_redirected_to tipo_contratos_path
  end
end
