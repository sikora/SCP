require 'test_helper'

class IndicadoresControllerTest < ActionController::TestCase
  setup do
    @indicador = indicadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicador" do
    assert_difference('Indicador.count') do
      post :create, indicador: { cpf: @indicador.cpf, idpartido: @indicador.idpartido, nminidicador: @indicador.nminidicador, telefone: @indicador.telefone }
    end

    assert_redirected_to indicador_path(assigns(:indicador))
  end

  test "should show indicador" do
    get :show, id: @indicador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicador
    assert_response :success
  end

  test "should update indicador" do
    put :update, id: @indicador, indicador: { cpf: @indicador.cpf, idpartido: @indicador.idpartido, nminidicador: @indicador.nminidicador, telefone: @indicador.telefone }
    assert_redirected_to indicador_path(assigns(:indicador))
  end

  test "should destroy indicador" do
    assert_difference('Indicador.count', -1) do
      delete :destroy, id: @indicador
    end

    assert_redirected_to indicadores_path
  end
end
