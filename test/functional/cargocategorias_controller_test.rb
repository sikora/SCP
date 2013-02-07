require 'test_helper'

class CargocategoriasControllerTest < ActionController::TestCase
  setup do
    @cargocategoria = cargocategorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargocategorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargocategoria" do
    assert_difference('Cargocategoria.count') do
      post :create, cargocategoria: { id_cargo: @cargocategoria.id_cargo, id_categoria: @cargocategoria.id_categoria, id_contrato: @cargocategoria.id_contrato, id_orgao: @cargocategoria.id_orgao, valor: @cargocategoria.valor }
    end

    assert_redirected_to cargocategoria_path(assigns(:cargocategoria))
  end

  test "should show cargocategoria" do
    get :show, id: @cargocategoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargocategoria
    assert_response :success
  end

  test "should update cargocategoria" do
    put :update, id: @cargocategoria, cargocategoria: { id_cargo: @cargocategoria.id_cargo, id_categoria: @cargocategoria.id_categoria, id_contrato: @cargocategoria.id_contrato, id_orgao: @cargocategoria.id_orgao, valor: @cargocategoria.valor }
    assert_redirected_to cargocategoria_path(assigns(:cargocategoria))
  end

  test "should destroy cargocategoria" do
    assert_difference('Cargocategoria.count', -1) do
      delete :destroy, id: @cargocategoria
    end

    assert_redirected_to cargocategorias_path
  end
end
