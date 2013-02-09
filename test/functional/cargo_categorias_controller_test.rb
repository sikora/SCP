require 'test_helper'

class CargoCategoriasControllerTest < ActionController::TestCase
  setup do
    @cargo_categoria = cargo_categorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargo_categorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo_categoria" do
    assert_difference('CargoCategoria.count') do
      post :create, cargo_categoria: { cargo_id: @cargo_categoria.cargo_id, categoria_id: @cargo_categoria.categoria_id, contrato_id: @cargo_categoria.contrato_id, valor: @cargo_categoria.valor }
    end

    assert_redirected_to cargo_categoria_path(assigns(:cargo_categoria))
  end

  test "should show cargo_categoria" do
    get :show, id: @cargo_categoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo_categoria
    assert_response :success
  end

  test "should update cargo_categoria" do
    put :update, id: @cargo_categoria, cargo_categoria: { cargo_id: @cargo_categoria.cargo_id, categoria_id: @cargo_categoria.categoria_id, contrato_id: @cargo_categoria.contrato_id, valor: @cargo_categoria.valor }
    assert_redirected_to cargo_categoria_path(assigns(:cargo_categoria))
  end

  test "should destroy cargo_categoria" do
    assert_difference('CargoCategoria.count', -1) do
      delete :destroy, id: @cargo_categoria
    end

    assert_redirected_to cargo_categorias_path
  end
end
